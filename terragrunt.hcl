locals {
  aws_region = "us-east-2"
  project     = "example-project"

  # s3_state_bucket = "${local.project}-tfstate"
  # dynamodb_lock_table = "${local.project}-tfstate-lock"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    provider "aws" {
      region = "${local.aws_region}"
      default_tags {
        tags = {
          "Environment" = "${basename(dirname(get_terragrunt_dir()))}"
          "Project" = "${local.project}"
          "Terraform" = "true"
        }
      }
    }
  EOF
}

# generate "backend" {
#   path      = "backend.tf"
#   if_exists = "overwrite"
#   contents  = <<-EOF
#     terraform {
#       backend "s3" {}
#     }
#   EOF
# }
#
# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = local.s3_state_bucket
#     dynamodb_table = local.dynamodb_lock_table
#     encrypt        = true
#     key            = "${local.aws_region}/${path_relative_to_include()}/terraform.tfstate"
#     region         = local.aws_region
#   }
# }
