provider "aws" {
  region = "us-east-1"
  profile  = "Sam"
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policy for CloudWatch logging
resource "aws_iam_role_policy_attachment" "lambda_logs_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Create the Node.js Lambda code file
resource "local_file" "lambda_code" {
  filename = "${path.module}/index.js"
  content  = <<-EOT
    exports.handler = async (event) => {
        return {
            statusCode: 200,
            body: "Hello from Lambda with Terraform and Node.js!"
        };
    };
  EOT
}

# Automatically zip the Lambda code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = local_file.lambda_code.filename
  output_path = "${path.module}/lambda.zip"
}

# Create Lambda function
resource "aws_lambda_function" "my_lambda" {
  function_name = "MyTerraformLambdaNodeJS"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
