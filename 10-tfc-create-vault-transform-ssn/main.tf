resource "vault_mount" "ssn" {
  path = var.transform_ssn_path
  type = "transform"
}
resource "vault_transform_role" "ssn" {
  path = vault_mount.ssn.path
  name = var.ssn_role_name
  transformations = var.ssn_transformation
}

resource "vault_transform_transformation" "ssn" {
  path          = vault_mount.ssn.path
  name          = var.ssn_transformation_name
  type          = var.ssn_transformation_type
  template      = var.ssn_transformation_template
  allowed_roles = var.allowd_roles
  tweak_source = var.ssn_tweak_source
}

