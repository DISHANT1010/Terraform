resource "aws_dynamodb_table" "lockfile_table" {
  name           = "lockfile_dynamodb_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "lockfile_dynamodb_table"
  }
}