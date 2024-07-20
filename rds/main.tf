resource "aws_db_instance" "this" {
  identifier                      = var.identifier
  name                            = var.db_name
  engine                          = var.engine
  engine_version                  = var.engine_version
  storage_type                    = var.storage_type
  instance_class                  = var.instance_class
  allocated_storage               = var.allocated_storage
  port                            = var.port
  domain                          = var.domain
  domain_iam_role_name            = var.domain_iam_role_name
  username                        = var.username
  password                        = var.password
  skip_final_snapshot             = var.skip_final_snapshot
  storage_encrypted               = var.storage_encrypted
  kms_key_id                      = var.kms_key_id
  db_subnet_group_name            = var.db_subnet_group_name
  parameter_group_name            = var.parameter_group_name
  vpc_security_group_ids          = var.vpc_security_group_ids
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.backup_window
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade
  maintenance_window              = var.maintenance_window
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  option_group_name               = var.option_group_name
  character_set_name              = var.character_set_name
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  timezone                        = var.timezone
  multi_az                        = var.multi_az
  license_model                   = var.license_model
  apply_immediately               = var.apply_immediately
  availability_zone               = var.availability_zone
  tags = merge(
    {
      Name        = "DatabaseServer",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}