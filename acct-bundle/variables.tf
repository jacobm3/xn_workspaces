variable "project_name" {
  type = string
  description = "Name of the project, used for the gitlab project, TFE workspace, and Vault namespace"
}

variable "project_email" {
  type = string
  description = "Email address tied to the new AWS account to be created"
}

variable "tfe_org" {
  type = string
  description = "Existing parent TFE organization in which the new TFE workspace will be created"
}

variable "vcs_org" {
  type = string
  description = "Existing VCS account or organization in which the new VCS repo/project will be created"
}

variable "vcs_oauth_token_id" {
  type = string
  description = "OAuth token ID for an existing VCS connection in TFE"
}


