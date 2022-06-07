
resource "aws_s3_bucket" "bucket" {

  bucket = "09432804238423098"
  acl    = "private"
  versioning {
    enabled = false
  }
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}




