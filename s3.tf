resource "aws_s3_bucket" "b" {
  bucket = "osee12345"
  acl    = "private"

  versioning {
    enabled = true
  }
}