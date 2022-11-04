resource "aws_s3_bucket" "ball" {
  bucket = "osee12345"
  }
  resource "aws_s3_bucket_public_access_block" "ball" {
  bucket = aws_s3_bucket.ball.id

  block_public_acls   = false
  block_public_policy = true
}