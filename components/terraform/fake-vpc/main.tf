provider "random" {}

resource "random_string" "vpc_id_suffix" {
  length           = 16
  lower            = false
  override_special = "abcdef"
  special          = true
  upper            = false
}