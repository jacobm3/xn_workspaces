resource "aws_organizations_account" "account" {
  name  = var.project_name
  email = var.project_email
}

resource "aws_iam_access_key" "admin" {
  user    = "${aws_iam_user.admin.name}"
  pgp_key = var.pgp_key
}

resource "aws_iam_user" "admin" {
  name = "admin"
}

resource "aws_iam_user_policy" "admin_policy" {
  name = "admin"
  user = "${aws_iam_user.admin.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "gitlab_project" "test" {
     name = var.project_name
     initialize_with_readme = true
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [gitlab_project.test]

  create_duration = "30s"
}

resource "tfe_workspace" "test" {
  name         = var.project_name
  organization = var.tfe_org
  vcs_repo {
    identifier       = "${var.vcs_org}.${var.project_name}"
    oauth_token_id   = var.vcs_oauth_token_id
  }

  depends_on = [time_sleep.wait_30_seconds]
}

