resource "gitlab_project" "test" {
     name = "xn_test"
     initialize_with_readme = true
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [gitlab_project.test]

  create_duration = "30s"
}

resource "tfe_workspace" "xn_test" {
  name         = "xn_test"
  organization = "jacobm3"
  vcs_repo {
    identifier         = "jacobm3/xn_test"
    oauth_token_id     = var.oauth_token_id
  }

  depends_on = [time_sleep.wait_30_seconds]
}

