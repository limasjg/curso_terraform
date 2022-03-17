resource "aws_iam_user" "the-accouts" {
  for_each = toset(["Joao", "Andre", "Kauan", "Pedro"])
  name     = each.key
}