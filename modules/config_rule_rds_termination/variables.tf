variable "rule_name" {
  description = "Name of the config rule"
  type        = string
  default = "DeleteProdRds"
}

variable "rds_instance" {
  description = "Identifier of the RDS instance"
  type        = string
  default = "prod"
}
