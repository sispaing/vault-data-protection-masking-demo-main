variable "current_organization_name" {
  type        = string
  description = "Existing Organization Name"
  default     = null
}

variable "current_project_name" {
  type        = string
  description = "Existing Project Name"
  default     = null
}

variable "vcs_workspace_info" {
  type = list(object({
    name                   = string
    assessments_enabled    = bool
    auto_apply             = bool
    auto_apply_run_trigger = bool
    queue_all_runs         = bool
    description            = string
    global_remote_state = bool
    remote_state_consumer_ids = set(any)
    vcs_repo = object({
      identifier     = string
      branch         = string
    })
    working_directory = string
    trigger_patterns = list(any)
    tag_names         = list(string)
  }))
  default = [ {
    name = null
    assessments_enabled = false
    auto_apply = false
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = null
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = null
      branch = null
    }
    working_directory = null
    trigger_patterns = [  ]
    tag_names = [ null ]

  } ]
}

variable "oauth_client" {
  type        = string
  description = "OAuth Client Name"
  default     = null
}

variable "oauth_token" {
  type        = string
  description = "OAuth TOKEN"
  default     = null
}


variable "cli_workspace_info" {
  type = list(object({
    name                   = string
    assessments_enabled    = bool
    auto_apply             = bool
    auto_apply_run_trigger = bool
    queue_all_runs         = bool
    description            = string
    global_remote_state = bool
    remote_state_consumer_ids = set(any)
    tag_names              = list(string)
  }))
  default = [ {
    name = null
    assessments_enabled = false
    auto_apply = false
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = null
    global_remote_state = false
    remote_state_consumer_ids = []
    tag_names = [ null ]
  } ]
}