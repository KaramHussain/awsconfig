resource "aws_config_config_rule" "rds_termination" {
  name = var.rule_name

  source {
    owner             = "AWS"
    source_identifier = "RDS_CLUSTER_DELETION_PROTECTION_ENABLED"
  }
}


