variable "transform_ccn_path" {
  default = "data_protection/masking/transform"
  description = "Path to where the back-end is mounted within Vault."
}

variable "ccn_role_name" {
  default = "ccn"
  description = "The name of the role."
}

variable "ccn_transformation" {
  default = ["ccn"]
  description = "A comma separated string or slice of transformations to use."
}

variable "ccn_transformation_name" {
  default = "ccn"
  description = "A comma separated string or slice of transformations to use."
}

variable "ccn_transformation_type" {
  default = "masking"
  description = "The type of transformation to perform."
}

variable "ccn_transformation_template" {
  default = "card-mask"
  description = "The name of the template to use."
}

variable "allowd_roles" {
  default = ["ccn"]
  description = "The set of roles allowed to perform this transformation."
}

variable "ccn_template_type" {
  default = "regex"
  description = "The pattern type to use for match detection. Currently, only regex is supported."
}

variable "ccn_template_pattern" {
  default = "(\\d{4})-(\\d{4})-(\\d{4})-\\d{4}"
  description = "The pattern used for matching. Currently, only regular expression pattern is supported."
}

variable "ccn_template_alphabet" {
  default = "builtin/numeric"
  description = "The alphabet to use for this template. This is only used during FPE transformations."
}
