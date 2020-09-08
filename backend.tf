#Multiple project related files can be placed inside sampleproj directory
terraform{
	backend "s3" {
		bucket = "terra-sample"
		key = "infra/terraform/nginxproj/remotestate/terraform.tfstate"
		region = "us-west-2"
		
	}

}