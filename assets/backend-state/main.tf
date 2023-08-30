resource "random_string" "random" {
  length = 8
  upper = false
  lower = true
  numeric = true
  special = false
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  #bucket = "var.aws_bucket_name-${random_string.random.result}"
  bucket = "jenkins-terraform-state-bucket-${random_string.random.result}" # Should be var.aws_bucket_name
  

#   lifecycle {
#     prevent_destroy = true
#   }

}


resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


resource "aws_s3_bucket_versioning" "bucket_version" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}