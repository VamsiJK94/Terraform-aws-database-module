output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this.arn, "")
}