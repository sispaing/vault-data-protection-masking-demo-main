output "ssn_secret_path" {
  value = vault_mount.ssn.path
}

output "ssn_secret_role_name" {
  value = vault_transform_role.ssn.name
}

output "ssn_secret_transformation_name" {
  value = vault_transform_transformation.ssn.name
}

output "ssn_secret_template_name" {
  value = vault_transform_transformation.ssn.template
}