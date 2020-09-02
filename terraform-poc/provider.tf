# Setup the AWS provider | provider.tf

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version     = ">= 2.12"
  region      = "us-west-2"
  access_key  = ""
  secret_key  = ""
}
