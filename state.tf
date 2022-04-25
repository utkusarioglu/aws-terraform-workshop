resource "aws_s3_bucket" "ws_aws_tf_state" {
  bucket = "ws-aws-terraform-state"
}

resource "aws_s3_bucket_versioning" "ws_aws_tf_state" {
  bucket = aws_s3_bucket.ws_aws_tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ws_aws_tf_state" {
  bucket = aws_s3_bucket.ws_aws_tf_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# resource "aws_dynamodb_table" "ws_aws_terraform_state_lock" {
#   name         = "ws-aws-terraform-gh-actions-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
