# Setup the AWS provider | provider.tf

terraform {
  required_version = ">= 0.12"
  
  required_providers {
  
  docker = {
      source = "terraform-providers/docker"
    }

  aws = {
      source = "hashicorp/aws"
    }
	
  }
}

provider "aws" {
  version     = ">= 2.12"
  region      = "us-west-2"
  access_key  = ""
  secret_key  = ""
}





      
