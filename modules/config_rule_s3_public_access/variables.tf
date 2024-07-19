variable "rule_name" {
  description = "Name of the config rule"
  type        = string
  default = "PublicAccessToS3"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default = "prod"
}
