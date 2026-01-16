resource "aws_s3_bucket" "pizza_bucket"{
  bucket = "tf-test-bucket-davide"
}

# Enable versioning on the bucket
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.pizza_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Create the "uploads" folder (S3 object with trailing slash)
resource "aws_s3_object" "uploads_folder" {
  bucket = aws_s3_bucket.pizza_bucket.id
  key    = "uploads/"
  content = ""
}