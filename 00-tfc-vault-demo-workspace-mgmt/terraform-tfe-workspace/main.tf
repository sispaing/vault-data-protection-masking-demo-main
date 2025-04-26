data "tfe_project" "current" {
  count = var.use_current_project ? 1 : 0
  name = var.current_project_name
  organization = var.current_organization_name
}

data "tfe_organization" "current" {
  count = var.use_current_organization ? 1 : 0
  name = var.current_organization_name
}

data "tfe_oauth_client" "client" {
  count = var.use_current_oauth ? 1 : 0
  oauth_client_id = var.oauth_client_id
}

resource "tfe_organization" "this" {
#   for_each = var.create_both_org_proj ? var.organization_info : [{}]
  for_each = { for k, v in var.organization_project_info : k => v if var.create_both_org_proj } 
  name  = each.value.name
  email = each.value.email
}

resource "tfe_project" "this" {
  for_each = { for k, v in var.organization_project_info : k => v if var.create_both_org_proj } 
  organization = tfe_organization.this[each.key].name
  name = each.value.project_name
}

resource "tfe_project" "only_project" {
  count = var.create_only_project ? length(var.projectname) : 0
  organization = element(data.tfe_organization.current[*].name, 0)
  name = var.projectname[count.index]
}


resource "tfe_organization_token" "org_token" {
  count = var.create_org_token ? length(var.organization_project_info) : 0
  organization = tfe_organization.this[count.index].id
}

###########################################################
#Workspace
###########################################################

# locals {
#   oauth_token_id = var.create_oauth_client && !var.use_current_oauth ? tfe_oauth_client.oauth_this[0].oauth_token_id : data.tfe_oauth_client.client[0].oauth_token_id
# }

###########################################################
#1. Create VCS Workflow Workspace under New Organization, New Project
resource "tfe_workspace" "new_org_proj_vcs_workspace" {
#  for_each = var.create_workspace_with_org_proj && var.create_vcs_workflow && var.create_both_org_proj ? toset(var.vcs_workspace_info) : toset([{}])
  for_each = { for k, v in var.vcs_workspace_info : k => v if var.create_workspace_with_org_proj && var.create_vcs_workflow && var.create_both_org_proj && var.create_oauth_client}
  description = each.value.description
  name         = each.value.name
  organization = tfe_organization.this[0].id
  project_id   = tfe_project.this[0].id
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  vcs_repo {
    identifier = each.value.vcs_repo.identifier
    branch = each.value.vcs_repo.branch
    oauth_token_id = var.create_oauth_client && !var.use_current_oauth ? tfe_oauth_client.oauth_this[0].oauth_token_id : data.tfe_oauth_client.client[0].oauth_token_id
  }
  working_directory = each.value.working_directory
  trigger_patterns = each.value.trigger_patterns
  tag_names    = each.value.tag_names
}

#########################################################################
#2. Create CLI Workflow Workspace under New Organization, New Project
resource "tfe_workspace" "new_org_proj_cli_workspace" {
#  for_each = var.create_workspace_with_org_proj && !var.create_vcs_workflow ? toset(var.cli_workspace_info) : toset([{}])
  for_each = { for k, v in var.cli_workspace_info : k => v if var.create_workspace_with_org_proj && !var.create_vcs_workflow && var.create_both_org_proj && !var.create_oauth_client }
  description = each.value.description
  name         = each.value.name
  organization = tfe_organization.this[0].id
  project_id   = tfe_project.this[0].id
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  tag_names    = each.value.tag_names
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
}

###########################################################
#3. Create VCS Workflow Workspace under Existing Organization, New Project
resource "tfe_workspace" "new_proj_vcs_workspace" {
#  for_each = var.create_workspace_with_only_new_proj && var.create_vcs_workflow && var.create_only_project && create_oauth_client ? toset(var.vcs_workspace_info) : toset([{}])
  for_each = { for k, v in var.vcs_workspace_info : k => v if var.create_workspace_with_only_new_proj && var.create_vcs_workflow && var.create_only_project && var.create_oauth_client }
  description = each.value.description
  name         = each.value.name
  organization = element(data.tfe_organization.current[*].name, 0)
  project_id   = tfe_project.only_project[0].id
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  vcs_repo {
    identifier = each.value.vcs_repo.identifier
    branch = each.value.vcs_repo.branch
    oauth_token_id = var.create_oauth_client && !var.use_current_oauth ? tfe_oauth_client.oauth_current_this[0].oauth_token_id : data.tfe_oauth_client.client[0].oauth_token_id
  }
  working_directory = each.value.working_directory
  tag_names    = each.value.tag_names
}

#########################################################################
#4. Create CLI Workflow Workspace under Existing Organization, New Project
resource "tfe_workspace" "new_proj_cli_workspace" {
#  for_each = var.create_workspace_with_only_new_proj && !var.create_vcs_workflow ? toset(var.cli_workspace_info) : toset([{}])
  for_each = { for k, v in var.cli_workspace_info : k => v if var.create_workspace_with_only_new_proj && !var.create_vcs_workflow && !var.create_oauth_client }
  description = each.value.description
  name         = each.value.name
  organization = element(data.tfe_organization.current[*].name, 0)
  project_id   = tfe_project.only_project[0].id
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  tag_names    = each.value.tag_names
}

###########################################################
#5. Create VCS Workflow Workspace under Existing Organization and Project
resource "tfe_workspace" "existing_org_proj_vcs_workspace" {
#  for_each = var.create_workspace_with_existing_org_proj && var.create_vcs_workflow && var.create_both_org_proj ? toset(var.vcs_workspace_info) : toset([{}])
  for_each = { for k, v in var.vcs_workspace_info : k => v if var.create_workspace_with_existing_org_proj && var.create_vcs_workflow && var.create_oauth_client }
  description = each.value.description
  name         = each.value.name
  organization = element(data.tfe_organization.current[*].name, 0)
  project_id   = element(data.tfe_project.current[*].id, 0)
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  vcs_repo {
    identifier = each.value.vcs_repo.identifier
    branch = each.value.vcs_repo.branch
    oauth_token_id = var.create_oauth_client && !var.use_current_oauth ? tfe_oauth_client.oauth_current_this[0].oauth_token_id : data.tfe_oauth_client.client[0].oauth_token_id
  }
  working_directory = each.value.working_directory
  tag_names    = each.value.tag_names
}

#########################################################################
#6. Create CLI Workflow Workspace under Existing Organization, New Project
resource "tfe_workspace" "existing_org_proj_cli_workspace" {
#  for_each = var.create_workspace_with_existing_org_proj && !var.create_vcs_workflow ? toset(var.cli_workspace_info) : toset([{}])
  for_each = { for k, v in var.cli_workspace_info : k => v if var.create_workspace_with_existing_org_proj && !var.create_vcs_workflow && !var.create_oauth_client }
  description = each.value.description
  name         = each.value.name
  organization = element(data.tfe_organization.current[*].name, 0)
  project_id   = element(data.tfe_project.current[*].id, 0)
  assessments_enabled = each.value.assessments_enabled
  auto_apply = each.value.auto_apply
  auto_apply_run_trigger = each.value.auto_apply_run_trigger
  queue_all_runs = each.value.queue_all_runs
  global_remote_state = each.value.global_remote_state
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  tag_names    = each.value.tag_names
}


###########################################################
#Oauth Client
###########################################################

resource "tfe_oauth_client" "oauth_this" {
  count = var.create_oauth_client && var.create_both_org_proj ? 1 : 0
  name             = var.oauth_client
  organization     = tfe_organization.this[count.index].id
  api_url          = var.oauth_api_url
  http_url         = var.oauth_http_url
  oauth_token      = var.oauth_token
  service_provider = var.oauth_service_provider
  organization_scoped = var.oauth_organization_scoped
}

resource "tfe_oauth_client" "oauth_current_this" {
  count = var.create_oauth_client && var.use_current_organization ? 1 : 0
  name             = var.oauth_client
  organization     = data.tfe_organization.current[count.index].name
  api_url          = var.oauth_api_url
  http_url         = var.oauth_http_url
  oauth_token      = var.oauth_token
  service_provider = var.oauth_service_provider
  organization_scoped = var.oauth_organization_scoped
}







