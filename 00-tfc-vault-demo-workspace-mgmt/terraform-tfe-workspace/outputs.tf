output "current_project_id" {
  description = "Project ID of Current Project"
  value = try(data.tfe_project.current[*].id, null)
}

output "current_organization_id" {
  description = "Organization Name of Current Organization"
  value = try(data.tfe_organization.current[*].name, null)
}

output "created_organization_id" {
  description = "Created Organization ID of New Organization"
  value = try(tfe_organization.this[*].id, null)
}

output "created_project_id" {
  description = "Created Project ID of New Project"
  value = try(coalescelist(tfe_project.this[*].id, tfe_project.only_project[*].id), null)
}

output "created_project_name" {
  description = "Created Project ID of New Project"
  value = try(coalescelist(tfe_project.this[*].name, tfe_project.only_project[*].name), null)
}

output "created_organization_token" {
  description = "Created Organization token of New Organization"
  value = try(tfe_organization_token.org_token[*].token, null)
  sensitive = true
}

output "vcs_workflow_workspace_id_Only_New_Project" {
  description = "Created VCS Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.new_proj_vcs_workspace : k => workspace.id}, null)
}

output "vcs_workflow_workspace_id_New_Organization_Project" {
  description = "Created VCS Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.new_org_proj_vcs_workspace : k => workspace.id}, null)
}

# output "vcs_workflow_workspace_id_Current_Org_Project" {
#   description = "Created VCS Workflow WorkSpace ID"
#   value = try([for workspace in tfe_workspace.existing_org_proj_vcs_workspace : workspace.id], null)
# }

output "vcs_workflow_workspace_id_Current_Org_Project" {
  description = "Created VCS Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.existing_org_proj_vcs_workspace : k => workspace.id}, null)
}

output "cli_workflow_workspace_id_Only_New_Project" {
  description = "Created CLI Driven Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.new_proj_cli_workspace : k => workspace.id}, null)
}

output "cli_workflow_workspace_id_New_Organization_Project" {
  description = "Created CLI Driven Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.new_org_proj_cli_workspace : k => workspace.id}, null)
}

output "cli_workflow_workspace_id_Current_Org_Project" {
  description = "Created CLI Driven Workflow WorkSpace ID"
  value = try({for k, workspace in tfe_workspace.existing_org_proj_cli_workspace : k => workspace.id}, null)
}

output "created_oauth_client_id" {
  description = "The OAuth client ID. This will match oauth_client_id"
  value = try(tfe_oauth_client.oauth_current_this[*].id, null)
}

output "created_oauth_client_api_url" {
  description = "The client's API URL."
  value = try(tfe_oauth_client.oauth_current_this[*].api_url, null)
}

output "created_oauth_client_oauth_token_id" {
  description = "The ID of the OAuth token associated with the OAuth client."
  value = try(tfe_oauth_client.oauth_current_this[*].oauth_token_id, null)
}

output "created_oauth_client_oauth_name" {
  description = "The name of the OAuth client (may be null)."
  value = try(tfe_oauth_client.oauth_current_this[*].name, null)
}






