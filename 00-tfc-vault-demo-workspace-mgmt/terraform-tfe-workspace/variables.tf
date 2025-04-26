variable "use_current_project" {
  type        = bool
  description = "If you want to use existing project, set true"
  default     = false
}

variable "use_current_organization" {
  type        = bool
  description = "If you want to use existing organization, set true"
  default     = false
}

variable "create_both_org_proj" {
  type        = bool
  description = "If you want to create new organization and project, set true"
  default     = false
}

variable "create_only_project" {
  type        = bool
  description = "If you want to create only new project"
  default     = false
}

variable "create_org_token" {
  type        = bool
  description = "If you want to create Organization Token"
  default     = false
}

variable "create_workspace_with_org_proj" {
  type        = bool
  description = "If you want to create Organization Token"
  default     = false
}

variable "create_workspace_with_only_new_proj" {
  type        = bool
  description = "If you want to create Organization Token"
  default     = false
}

variable "create_workspace_with_existing_org_proj" {
  type        = bool
  description = "If you want to create Organization Token"
  default     = false
}

variable "create_vcs_workflow" {
  type        = bool
  description = "if you want to create VCS Workflow Workspace. set True"
  default     = false
}

variable "create_oauth_client" {
  type        = bool
  description = "if you want to create VCS Workflow Workspace. set True"
  default     = false
}

variable "use_current_oauth" {
  type        = bool
  description = "To use Current Oauth Client"
  default     = false
}


variable "current_project_name" {
  type        = string
  description = "Existing Project Name"
  default     = null
}

variable "current_organization_name" {
  type        = string
  description = "Existing Organization Name"
  default     = null
}

variable "organization_project_info" {
  type = list(object({
    name  = string
    email = string
    project_name = string
  }))
  description = "Required Info to crete organization and project"
  default = [{
    email = null
    name  = null
    project_name = null
  }]
}

variable "projectname" {
  type        = list(any)
  description = "Project Name to Create Projects"
  default     = [null]
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

variable "oauth_client_id" {
  type        = string
  description = "OAuth Client ID"
  default     = null
}

variable "oauth_client" {
  type        = string
  description = "OAuth Client Name"
  default     = null
}

variable "oauth_api_url" {
  type        = string
  description = "OAuth API URL"
  default     = "https://api.github.com"
}

variable "oauth_http_url" {
  type        = string
  description = "OAuth HTTP URL"
  default     = "https://github.com"
}

variable "oauth_token" {
  type        = string
  description = "OAuth TOKEN"
  default     = null
}

variable "oauth_service_provider" {
  type        = string
  description = "OAuth Service Provider"
  default     = "github"
}

variable "oauth_organization_scoped" {
  type        = bool
  description = "OAuth Service Provider"
  default     = true
}

