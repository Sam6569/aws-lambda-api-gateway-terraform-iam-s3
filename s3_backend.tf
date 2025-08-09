# Create S3 bucket for Lambda storage or logs
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-s3-backend-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name = "Lambda S3 Backend"
  }
}

# Random suffix to ensure bucket name is globally unique
resource "random_id" "bucket_id" {
  byte_length = 4
}

# IAM policy to allow Lambda to interact with this S3 bucket
resource "aws_iam_policy" "lambda_s3_policy" {
  name        = "lambda-s3-policy"
  description = "Allow Lambda to read/write to S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource = [
          "${aws_s3_bucket.lambda_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Attach policy to the Lambda execution role from Task 1
resource "aws_iam_role_policy_attachment" "lambda_s3_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_s3_policy.arn
}
