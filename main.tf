module "centon-qa" {
  source = "./acct-bundle"
  project_name = "centon-qa"
  project_email = "tfetlz-centon-qa@gmail.com"
  tfe_org = "jacobm3"
  vcs_org = "jacobm3"
  vcs_oauth_token_id = var.oauth_token_id
}

module "centon-prod" {
  source = "./acct-bundle"
  project_name = "centon-qa"
  project_email = "tfetlz-centon-prod@gmail.com"
  tfe_org = "jacobm3"
  vcs_org = "jacobm3"
  vcs_oauth_token_id = var.oauth_token_id
}

