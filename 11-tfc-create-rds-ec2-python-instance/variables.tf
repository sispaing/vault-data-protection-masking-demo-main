variable "vault_addr" {
  description = "Vault Address, Need to update"
  default     = "https://hcp-vault-cluster-private-vault-3e5e8b07.364fe2ae.z1.hashicorp.cloud:8200"
}
variable "vpc_id" {
  description = "VPC ID, Need to update"
  default     = "vpc-066cc46d927a29dc6"
}

####################################################################
# VPC Security Group
####################################################################
variable "rds_security_group_name" {
  description = "Name of the RDS security group"
  type        = string
  default     = "rds-security-group"
}

variable "db_from_port" {
  description = "Start port"
  type        = number
  default     = 3306
}

variable "db_to_port" {
  description = "End range port"
  type        = number
  default     = 3306
}


variable "public_ssh_security_group_name" {
  description = "Name of the SSH security group"
  type        = string
  default     = "public-ssh-security-group"
}

variable "private_ssh_security_group_name" {
  description = "Name of the SSH security group"
  type        = string
  default     = "private-ssh-security-group"
}

variable "ssh_from_port" {
  description = "Start port"
  type        = number
  default     = 22
}

variable "app_port" {
  description = "Start port"
  type        = number
  default     = 5000
}

variable "http_port" {
  description = "Start port"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Start port"
  type        = number
  default     = 443
}


variable "ssh_to_port" {
  description = "End range port"
  type        = number
  default     = 22
}



variable "vault_cluster_cidr" {
  description = "vault_cluster_cidr"
  type        = string
  default     = "172.23.16.0/20"
}

####################################################################
# AWS DB Instance
####################################################################
variable "lb_name" {
  description = "LB Name"
  type        = string
  default     = "app-lb"
}

variable "target_group" {
  description = "Target Group"
  default = {
    http = 80
    https = 443
  }
}

####################################################################
# AWS DB Instance
####################################################################

variable "engine" {
  description = "The database engine to use."
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use."
  type        = string
  default     = "8.0.35"
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "mysql01"
}

variable "username" {
  description = "Username for the master DB user."
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the master DB user."
  type        = string
  sensitive   = true
  default     = "Pazzword123"
}

variable "instance_class" {
  description = "The RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "storage_type" {
  description = "The RDS Storage Type."
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The amount of allocated storage."
  type        = string
  default     = "20"
}

variable "max_allocated_storage" {
  description = "Upper Limit of RDS can automatically scale the storage"
  type        = string
  default     = "22"
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group."
  type        = string
  default     = "db-subnet-group"
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = false
}

variable "mysql_port" {
  description = "Specifies the port that the database engine is listening on"
  type        = string
  default     = "3306"
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
  default     = "projectdb"
}

####################################################################
# AWS EC2 Instance
####################################################################

variable "instance_type" {
  description = "Instance type to use for the instance."
  type        = string
  default     = "t2.micro"
}

variable "environment_name" {
  description = "The Environment Name"
  type        = string
  default     = "vault-project"
}

####################################################################
# AWS IAM
####################################################################
variable "vault-client_role" {
  description = "Vault Client Role Name"
  type        = string
  default     = "ec2-vault-client-role"
}


