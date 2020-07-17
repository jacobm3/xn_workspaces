output "aws_acct_login_id" {
  value = aws_organizations_account.account.id
}

output "aws_acct_login_arn" {
  value = aws_organizations_account.account.arn
}

# output "vault_" {
#   value = aws_organizations_account.account.XX
# }