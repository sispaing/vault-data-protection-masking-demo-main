output "ccn_secret_path" {
  value = vault_mount.ccn.path
}

output "ccn_secret_role_name" {
  value = vault_transform_role.ccn.name
}

output "ccn_secret_transformation_name" {
  value = vault_transform_transformation.ccn.name
}

output "ccn_secret_template_name" {
  value = vault_transform_template.ccn.name
}

output "ccn_secret_template_pattern" {
  value = vault_transform_template.ccn.pattern
}