resource "vault_aws_secret_backend" "aws" {
  description = "Vault AWS Secret Engine Resource for AWS Master Account"
  access_key = aws_iam_access_key.vault_admin_accesskey.id
  secret_key = aws_iam_access_key.vault_admin_accesskey.secret
  region = var.aws_region
  path = var.secret_path.master_secret_path
  default_lease_ttl_seconds = 1200
  max_lease_ttl_seconds = 3000
  # lifecycle {
  #   ignore_changes = [
  #   access_key, secret_key
  #   ]
  # }
}

resource "vault_aws_secret_backend_role" "admin_dynamic_role" {
  backend = vault_aws_secret_backend.aws.path
  name = var.secret_role_name.master_admin_role_name
  credential_type = var.credential_type.iam_user
  policy_arns = var.policy_arns_name.admin
}


resource "vault_aws_secret_backend_role" "iam_admin_dynamic_role" {
  backend = vault_aws_secret_backend.aws.path
  name = var.secret_role_name.master_iamadmin_role_name
  credential_type = var.credential_type.iam_user
  policy_arns = var.policy_arns_name.iamadmin
}


resource "vault_aws_secret_backend_role" "network_admin_dynamic_role" {
  backend = vault_aws_secret_backend.aws.path
  name = var.secret_role_name.master_netadmin_role_name
  credential_type = var.credential_type.iam_user
  policy_arns = var.policy_arns_name.networkadmin
  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["iam:GetUser", 
      "ec2:DescribeAddressesAttribute", 
      "rds:CreateDBSubnetGroup", 
      "rds:AddTagsToResource",
      "rds:DescribeDBSubnetGroups",
      "rds:ListTagsForResource",
      "rds:DeleteDBSubnetGroup"],
      "Resource": "*"
    }
  ]
}
EOT
}

resource "vault_aws_secret_backend_role" "ec2_admin_dynamic_role" {
  backend = vault_aws_secret_backend.aws.path
  name = var.secret_role_name.master_ec2admin_role_name
  credential_type = var.credential_type.iam_user
  policy_arns = var.policy_arns_name.ec2admin
  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["iam:GetUser", "ec2:DescribeAddressesAttribute"],
      "Resource": "*"
    }
  ]
}
EOT
}

resource "vault_aws_secret_backend_role" "rds_admin_dynamic_role" {
  backend = vault_aws_secret_backend.aws.path
  name = var.secret_role_name.master_rdsadmin_role_name
  credential_type = var.credential_type.iam_user
  policy_arns = var.policy_arns_name.rdsadmin
  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iam:GetUser",
      "Resource": "*"
    }
  ]
}
EOT
}

