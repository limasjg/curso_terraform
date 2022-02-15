resource "aws_s3_bucket" "this" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags

}

resource "aws_s3_bucket" "manual" {
  bucket = "limasjg-bucket-for-test-to-import-gatana"

  tags = {
    Created   = "31/01/2022"
    imported  = "31/01/2022"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${local.ips_filepath}"
  source = local.ips_filepath
  etag   = filemd5(local.ips_filepath)

  content_type = "application/json"

  tags = local.common_tags

}

resource "aws_s3_bucket_object" "random" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${random_pet.bucket.id}.json"
  source = local.ips_filepath
  etag   = filemd5(local.ips_filepath)

  content_type = "application/json"

  tags = local.common_tags

}



