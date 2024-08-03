# Terraform AWS RDS Instance Module

This module creates an Amazon RDS (Relational Database Service) instance with customizable parameters.

## Usage

To use this module, include it in your Terraform configuration and provide the necessary input variables.

### Example

```hcl
module "rds_instance" {
  source = "./terraform-aws-rds-instance"

  identifier                  = "mydb-instance"
  db_name                     = "mydatabase"
  engine                      = "postgres"
  engine_version              = "13.3"
  instance_class              = "db.t3.medium"
  allocated_storage           = "20"
  storage_type                = "gp2"
  port                        = "5432"
  domain                      = null
  domain_iam_role_name        = null
  username                    = "dbuser"
  password                    = "dbpassword"
  skip_final_snapshot         = false
  storage_encrypted           = true
  kms_key_id                  = "arn:aws:kms:region:account-id:key/key-id"
  db_subnet_group_name        = "mydbsubnetgroup"
  parameter_group_name        = "default.postgres13"
  vpc_security_group_ids      = ["sg-12345678"]
  backup_retention_period     = "7"
  backup_window               = "01:00-03:00"
  auto_minor_version_upgrade  = true
  maintenance_window          = "Mon:00:00-Tue:00:00"
  copy_tags_to_snapshot       = true
  option_group_name           = "default"
  character_set_name          = null
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  timezone                    = "UTC"
  multi_az                    = true
  license_model               = "postgresql-license"
  apply_immediately           = true
  availability_zone           = "us-west-2a"

  tags = {
    Name        = "DatabaseServer"
    Project     = "MyProject"
    Environment = "Development"
  }
}
```
## Inputs

- `identifier` -The name of the RDS instance.
- `db_name` -The DB name to create. If omitted, no database is created initially.
- `engine` -The database engine to use e.g. postgres, mysql, sqlserver-ex.
- `engine_version` -The engine version to use. Omitting the minor release part allows for automatic updates.
- `instance_class` -The instance type of the RDS instance.
- `allocated_storage` -The allocated storage in gigabytes.
- `storage_type` -The allocated storage type.
- `port` -The port number on which the database accepts connections.
- `domain` -The Active Directory directory ID to create the DB instance in.
- `domain_iam_role_name` -The name of the IAM role to be used when making API calls to the Directory Service.
- `username` -Username for the master DB user.
- `password` -Password for the master DB user. Note that this may show up in logs and will be stored in the state file.
- `db_subnet_group_name` -Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group.
- `skip_final_snapshot` -Determines whether a final DB snapshot is created before the DB instance is deleted.
- `storage_encrypted` -Specifies whether the DB instance is encrypted.
- `kms_key_id` -The ARN for the KMS encryption key.
- `tags` -A mapping of tags to assign to the resource.
- `parameter_group_name` -Name of the DB parameter group to associate.
- `vpc_security_group_ids` -List of VPC security groups to associate.
- `backup_retention_period` -The days to retain backups.
- `backup_window` -The daily time range (in UTC) during which automated backups are created if they are enabled.
- `auto_minor_version_upgrade` -Indicates that minor version upgrades are allowed.
- `maintenance_window` -The window to perform maintenance in.
- `copy_tags_to_snapshot` -Copy all instance tags to snapshots.
- `option_group_name` -Name of the DB option group to associate.
- `character_set_name` -The character set name to use for DB encoding in Oracle and Microsoft SQL instances.
- `enabled_cloudwatch_logs_exports` -Set of log types to enable for exporting to CloudWatch logs.
- `timezone` -Time zone of the DB instance [only supported by Microsoft SQL Server].
- `multi_az` -Specifies if the RDS instance is multi-AZ.
- `license_model` -License model information for this DB instance.
- `apply_immediately` -Specifies whether any database modifications are applied immediately or during the next maintenance window.
- `availability_zone` -The AZ for the RDS instance.

## Outputs

- `db_instance_arn` -The ARN of the RDS instance.