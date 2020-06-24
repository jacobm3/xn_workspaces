# resource "gitlab_project" "test" {
#     name = "xn_test"
# }

resource "tfe_workspace" "xn_test" {
  name         = "xn_test"
  organization = "jacobm3"
}

