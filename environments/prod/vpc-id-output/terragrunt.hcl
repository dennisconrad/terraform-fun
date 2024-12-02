include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../components/terraform/fake-vpc-id-output"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  fake_vpc_id = dependency.vpc.outputs.vpc_id
}
