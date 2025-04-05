resource "aws_s3_bucket" "remot_backend_s3" {
  bucket = "remot-backend-s3"

  tags = {
    Name = "remot-backend-s3"
  }
}