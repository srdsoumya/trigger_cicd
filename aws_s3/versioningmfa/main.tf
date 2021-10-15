resource "aws_s3_bucket" "s3_bucket_versioning" {
  bucket = "${var.bucket_name}"
  acl    = "${var.acl}"

  versioning {
    enabled    = "${var.is_version}"
    mfa_delete = "${var.is_mfa}"
  }

  tags = {
    Name       = "${var.tag_name}"
  }
}
resource "aws_s3_bucket_object" "folder" {
    bucket = "${aws_s3_bucket.s3_bucket_versioning.id}"
    acl    = "${var.acl}"
    key    = "${var.tfstate}"
}
