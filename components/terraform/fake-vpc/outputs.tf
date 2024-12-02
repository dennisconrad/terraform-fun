data "aws_default_tags" "example" {}
output "aws_default_tags" {
  value = data.aws_default_tags.example.tags
}

output "vpc_id" {
  value = "vpc-${random_string.vpc_id_suffix.result}"
}
