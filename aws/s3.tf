resource "aws_s3_bucket" "ITP4121_220253432_bucket" {
  bucket = "itp4121-220253432-bucket"
}

resource "aws_s3_object" "temp_folder" {
  bucket = aws_s3_bucket.ITP4121_220253432_bucket.id
  key    = "image/"
}

resource "aws_s3_object" "no_hat_folder" {
  bucket = aws_s3_bucket.ITP4121_220253432_bucket.id
  key    = "data/"
}
