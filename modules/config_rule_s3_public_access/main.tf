resource "aws_config_config_rule" "s3_public_access" {
  name = var.rule_name

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

}
