variable "engine" {
  description = "The database engine to use  e.g. postgres, mysql, sqlserver-ex"
  type        = string
  default     = "postgres"
  validation {
    condition     = contains(["postgres", "mysql", "mariadb", "sqlserver-ee", "sqlserver-ex", "sqlserver-se", "sqlserver-web", "aurora", "aurora-mysql", "aurora-postgresql"], var.engine)
    error_message = "Choose one of Postgresql, MySQL, Microsoft SQL Server or Aurora."
  }
}

variable "engine_version" {
  description = "The engine version to use e.g. 11.15 for Postgresql, 8.0 for MySQL, 15.00.4073.23.v1 for MS-SQL. Omitting the minor release part allows for automatic updates."
  type        = string
  default     = "11"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t2.small"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "The allocated storage type"
  type        = string
  default     = "gp2"
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = null
}

variable "port" {
  description = "The port number on which the database accepts connections."
  default     = "5432"
}

variable "domain" {
  description = "The Active Directory directory ID to create the DB instance in."
  type        = string
  default     = null
}

variable "domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = null
}


variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key."
  type        = string
  default     = null
}

variable "tags" {
  default = {}
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate."
  type        = string
  default     = "default.postgres11"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
  default     = []
}

variable "backup_retention_period" {
  description = "The days to retain backups. Must be 1 or greater to be a source for a Read Replica"
  default     = "7"
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16"
  type        = string
  default     = ""
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor version upgrades are allowed."
  default     = true
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: \"ddd:hh24:mi-ddd:hh24:mi\". For example: \"Mon:00:00-Mon:03:00\"."
  type        = string
  default     = ""
}

variable "copy_tags_to_snapshot" {
  description = "Copy all instance tags to snapshots"
  default     = true
}

variable "option_group_name" {
  description = "Name of the DB option group to associate."
  default     = ""
  type        = string
}

variable "character_set_name" {
  description = "The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation)."
  default     = ""
  type        = string
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs."
  type        = list(string)
  default     = ["postgresql", "upgrade"]
}

variable "timezone" {
  description = "Time zone of the DB instance [only supported by Microsoft SQL Server]."
  type        = string
  default     = ""
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  default     = false
}

variable "license_model" {
  description = "License model information for this DB instance."
  type        = string
  default     = "postgresql-license"
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = true
}

variable "availability_zone" {
  description = "The AZ for the RDS instance."
  type        = string
  default     = "ap-southeast-1a"
}
