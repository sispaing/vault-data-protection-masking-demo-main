output "Customer_Key_Name" {
  value = vault_transit_secret_backend_key.customer_key.name
}

output "Archive_Key_Name" {
  value = vault_transit_secret_backend_key.archive_key.name
}