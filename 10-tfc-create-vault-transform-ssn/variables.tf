variable "transform_ssn_path" {
  default = "data_protection/transform"
  description = "Path to where the back-end is mounted within Vault."
}

variable "ssn_role_name" {
  default = "ssn"
  description = "The name of the role."
}

variable "ssn_transformation" {
  default = ["ssn"]
  description = "A comma separated string or slice of transformations to use."
}

variable "ssn_transformation_name" {
  default = "ssn"
  description = "A comma separated string or slice of transformations to use."
}

variable "ssn_transformation_type" {
  default = "fpe"
  description = "The type of transformation to perform."
}

variable "ssn_transformation_template" {
  default = "builtin/socialsecuritynumber"
  description = "The name of the template to use."
}

variable "allowd_roles" {
  default = ["ssn"]
  description = "The set of roles allowed to perform this transformation."
}

variable "ssn_tweak_source" {
  default = "internal"
  description = "The source of where the tweak value comes from. Only valid when in FPE mode."
}



