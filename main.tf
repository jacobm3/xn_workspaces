resource "gitlab_project" "test" {
     name = "xn_test"
}

resource "tfe_workspace" "xn_test" {
  name         = "xn_test"
  organization = "jacobm3"
  vcs_repo {
    identifier         = "jacobm3/xn_test"
  }

  depends_on = gitlab_project.test
}

