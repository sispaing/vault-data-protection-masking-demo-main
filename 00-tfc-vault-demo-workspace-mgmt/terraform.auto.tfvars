current_organization_name = "empower-sphere"
current_project_name = "vault-data-protection-demo"
vcs_workspace_info = [ {
    name = "02-tfc-create-hcp-vault-cluster"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "02-tfc-create-hcp-vault-cluster"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "02-tfc-create-hcp-vault-cluster"
    trigger_patterns = [  ]
    tag_names = [ "vault-cluster" ]

  },
  {
    name = "03-tfc-create-dynamic-provider-credential-vault"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "03-tfc-create-dynamic-provider-credential-vault"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "03-tfc-create-dynamic-provider-credential-vault"
    trigger_patterns = [  ]
    tag_names = [ "dynamic-provider-credential" ]

  },
  {
    name = "04-tfc-create-vault-aws-secret-dynamic-role"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "04-tfc-create-vault-aws-secret-dynamic-role"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "04-tfc-create-vault-aws-secret-dynamic-role"
    trigger_patterns = [  ]
    tag_names = [ "aws-secret-dynamic-role" ]

  },
  {
    name = "05-tfc-create-vpc-subnet-igw-ngw"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "05-tfc-create-vpc-subnet-igw-ngw"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "05-tfc-create-vpc-subnet-igw-ngw"
    trigger_patterns = [  ]
    tag_names = [ "aws-vpc" ]

  },
  {
    name = "06-tfc-create-hvn-vpc-peering"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "06-tfc-create-hvn-vpc-peering"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "06-tfc-create-hvn-vpc-peering"
    trigger_patterns = [  ]
    tag_names = [ "hvn-vpc-peering" ]

  },
  {
    name = "07-tfc-create-vault-aws-auth-backend"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "07-tfc-create-vault-aws-auth-backend"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "07-tfc-create-vault-aws-auth-backend"
    trigger_patterns = [  ]
    tag_names = [ "vault-aws-auth" ]

  },
  {
    name = "08-tfc-create-transit-engine"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "08-tfc-create-transit-engine"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "08-tfc-create-vault-transit-engine"
    trigger_patterns = [  ]
    tag_names = [ "vault-transit-engine" ]

  },
  {
    name = "09-tfc-create-vault-transform-ccn"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "09-tfc-create-vault-transform-ccn"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "09-tfc-create-vault-transform-ccn"
    trigger_patterns = [  ]
    tag_names = [ "vault-transform-ccn" ]

  },
  {
    name = "10-tfc-create-vault-transform-ssn"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "10-tfc-create-vault-transform-ssn"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "10-tfc-create-vault-transform-ssn"
    trigger_patterns = [  ]
    tag_names = [ "vault-transform-ssn" ]

  },
  {
    name = "11-tfc-create-rds-ec2-python-instance"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "11-tfc-create-rds-ec2-python-instance"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "11-tfc-create-rds-ec2-python-instance"
    trigger_patterns = [  ]
    tag_names = [ "aws-rds-ec2-python" ]

  },
  {
    name = "12-tfc-create-vault-database-secret-mysql"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "12-tfc-create-vault-database-secret-mysql"
    global_remote_state = false
    remote_state_consumer_ids = []
    vcs_repo = {
      identifier = "kyinaing/vault-data-protection-masking-demo"
      branch = "main"
    }
    working_directory = "12-tfc-create-vault-database-secret-mysql"
    trigger_patterns = [  ]
    tag_names = [ "vault-database-secret" ]

  },
   ]

  oauth_client = "github-vault-dp-demo"

  cli_workspace_info = [ {
    name = "01-tfc-vault-demo-variables-mgmt"
    assessments_enabled = false
    auto_apply = true
    auto_apply_run_trigger = false
    queue_all_runs = false
    description = "01-tfc-vault-demo-variables-mgmt"
    global_remote_state = false
    remote_state_consumer_ids = []
    tag_names = [ "variables-mgmt" ]
  } ]