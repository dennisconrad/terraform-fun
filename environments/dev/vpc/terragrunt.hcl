include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../components/terraform/fake-vpc"
}
