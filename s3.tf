resource "aws_s3_bucket" "lambda_layer_bucket" {
  bucket              = "lamdazipfilesforwenbsitedevaccount-ad"
#   acl                 = "private"
  force_destroy       = true
  object_lock_enabled = false
  tags = {
    Name        = "State Bucket"
  }
}
 
# Define the S3 bucket object for Lambda layer dependencies
resource "aws_s3_object" "common_dependencies" {
  bucket                 = aws_s3_bucket.lambda_layer_bucket.bucket
  key                    = "lambda_layers/common_dependencies.zip" # Object key in S3
  server_side_encryption = "AES256"
  source                 = "./lambda_layer_files/common_dependencies.zip" # Ensure file exists locally
  storage_class          = "STANDARD"
  tags = {
    Name       = "Common Lambda Layer"
    Layer_Type = "Dependencies"
  }
}