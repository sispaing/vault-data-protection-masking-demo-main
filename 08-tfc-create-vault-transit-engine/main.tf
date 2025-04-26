resource "vault_mount" "transit" {
  path                      = var.transit_engine_path
  type                      = var.transit_engine_type
  description               = "Enabling the vault transit secrets engine"
}

resource "vault_transit_secret_backend_key" "customer_key" {
  backend = vault_mount.transit.path
  name    = var.customer_key
}

resource "vault_transit_secret_backend_key" "archive_key" {
  backend = vault_mount.transit.path
  name    = var.archive_key
}