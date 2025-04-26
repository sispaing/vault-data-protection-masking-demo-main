module "vault_demo_workspace" {
  source = "./terraform-tfe-workspace"
  use_current_organization = true
  use_current_project = true
  create_workspace_with_existing_org_proj = true
  create_vcs_workflow = true
  create_oauth_client = true
  
  current_project_name = var.current_project_name
  current_organization_name = var.current_organization_name
  vcs_workspace_info = var.vcs_workspace_info
  oauth_client = var.oauth_client
  oauth_token = var.oauth_token
}

module "cli_workspace" {
  source = "./terraform-tfe-workspace"
  depends_on = [ module.vault_demo_workspace ]
  use_current_organization = true
  use_current_project = true
  create_workspace_with_existing_org_proj = true
  create_vcs_workflow = false
  
  current_project_name = var.current_project_name
  current_organization_name = var.current_organization_name
  cli_workspace_info = var.cli_workspace_info
}