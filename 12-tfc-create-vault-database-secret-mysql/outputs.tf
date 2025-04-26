output "readonly_rolename" {
  description = "Read Only Role Name"
  value = vault_database_secret_backend_role.readonly.name
}

output "readwrite_rolename" {
  description = "Read Write Role Name"
  value = vault_database_secret_backend_role.readwrite.name
}

output "vault_demo_app" {
  description = "vault_demo_app_role"
  value = vault_database_secret_backend_role.vault_demo_app.name
}