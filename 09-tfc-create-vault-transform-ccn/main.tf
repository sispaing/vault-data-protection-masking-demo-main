resource "vault_mount" "ccn" {
  path = var.transform_ccn_path
  type = "transform"
}
resource "vault_transform_role" "ccn" {
  path = vault_mount.ccn.path
  name = var.ccn_role_name
  transformations = var.ccn_transformation
}

resource "vault_transform_transformation" "ccn" {
  path          = vault_mount.ccn.path
  name          = var.ccn_transformation_name
  type          = var.ccn_transformation_type
  template      = var.ccn_transformation_template
  allowed_roles = var.allowd_roles
  masking_character = "#"
}

resource "vault_transform_template" "ccn" {
  path           = vault_mount.ccn.path
  name           = var.ccn_transformation_template
  type           = var.ccn_template_type
  pattern        = var.ccn_template_pattern
  alphabet       = var.ccn_template_alphabet
}