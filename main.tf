provider "aws" {
  region = var.region
}

module "config_rule_s3_public_access" {
  source      = "./modules/config_rule_s3_public_access"
}

module "config_rule_rds_termination" {
  source       = "./modules/config_rule_rds_termination"
}

resource "aws_iam_role" "config_role" {
  name = "aws-config-role"
  assume_role_policy = file("role/iam_role.json")
}

resource "aws_iam_policy" "config_policy" {
  name        = "aws-config-policy"
  description = "Policy to allow AWS Config actions"
  policy      = file("policies/iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "config_policy_attachment" {
  role       = aws_iam_role.config_role.name
  policy_arn = aws_iam_policy.config_policy.arn
}

resource "aws_config_configuration_recorder" "config" {
  role_arn = aws_iam_role.config_role.arn
  name     = "default"
}

resource "aws_config_configuration_recorder_status" "config" {
  is_enabled = true
  name       = aws_config_configuration_recorder.config.name
}

output "config_role_arn" {
  value = aws_iam_role.config_role.arn
}
