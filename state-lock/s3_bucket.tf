resource "aws_s3_bucket" "remot_backend_s3" {
  bucket = "remot_backend_s3"

  tags = {
    Name = "remot_backend_s3"
  }
}