resource "aws_s3_bucket_object" "lambda_log_file" {
  bucket  = aws_s3_bucket.lambda_bucket.bucket
  key     = "logs/init.log"
  content = "Lambda log storage initialized."

  depends_on = [
    aws_s3_bucket.lambda_bucket,
    aws_lambda_function.my_lambda
  ]
}

