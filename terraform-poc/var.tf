variable "aws_vpc_cidr" {
  description = "The CIDR of the main vpc"
  default = "172.31.0.0/16"
}
variable "aws_vpc_id" {
  description = "The VPC ID of the main vpc"
  default = "vpc-169cfa6e"
}
variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "512"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "1024"
}

variable "app_count" {
  description = "Number of replicas"
  default     = "1"
}

variable "image_tag" {
  description = "Tag of the docker image"
  #default     = "${image_tag}"
}