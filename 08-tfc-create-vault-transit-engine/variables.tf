variable "transit_engine_path" {
  description = "Where the secret backend will be mounted"
  default = "data_protection/transit"
}

variable "transit_engine_type" {
  description = "Type of the backend, such as transit"
  default = "transit"
}

variable "customer_key" {
  description = "The name to identify this key within the backend."
  default = "customer-key"
}

variable "archive_key" {
  description = "The name to identify this key within the backend."
  default = "archive-key"
}