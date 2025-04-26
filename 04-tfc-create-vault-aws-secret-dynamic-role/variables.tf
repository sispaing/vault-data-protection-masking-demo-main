variable "user_name" {
    description = "IAM User Name"
    type = string
    default = "vault-admin"
}

variable "inline_po_name" {
    description = "Vault Policy Name"
    type = string
    default = "vault-admin-policy"
}

variable "aws_region" {
    description = "AWS Region for Vault AWS Secret Role"
    default = "ap-southeast-1"
}

variable "secret_path" {
  description = "AWS Secret Engine Path"
  type = map(any)
  default = {
    "master_secret_path" = "aws-master-account"
  }
}

variable "secret_role_name" {
  description = "AWS Secret Engine Role Name"
  type = map(any)
  default = {
    "master_netadmin_role_name" = "master-networkadmin-role"
    "master_iamadmin_role_name" = "master-iamadmin-role"
    "master_ec2admin_role_name" = "master-ec2admin-role"
    "master_rdsadmin_role_name" = "master-rdsadmin-role"
    "master_admin_role_name" = "master-adminaccess-role"
  }
}

variable "credential_type" {
  description = "AWS Secret Engile Role Credential Type"
  type = map(any)
  default = {
    "iam_user" = "iam_user"
    "assumed_role" = "assumed_role"
    "federation_token" = "federation_token"
  }   
}

variable "policy_arns_name" {
  description = "List of AWS Policy ARN Name"
  type = map(any)
  default = {
    "networkadmin" = ["arn:aws:iam::aws:policy/AmazonVPCFullAccess"]
    "iamadmin" = ["arn:aws:iam::aws:policy/IAMFullAccess"]
    "ec2admin" = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess"]
    "rdsadmin" = ["arn:aws:iam::aws:policy/AmazonRDSFullAccess"]
    "admin" = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }   
}
  

