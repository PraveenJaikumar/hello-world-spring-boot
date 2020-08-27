resource "aws_ecs_cluster" "main" {
  name = "myapp-cluster"
}

data "template_file" "nginx_app" {
  template = file("./container.json")
  
  vars = {
    aws_region     = var.aws_region
	image_tag	   = var.image_tag
	#fargate_cpu    = var.fargate_cpu
    #fargate_memory = var.fargate_memory
  }
  
}

resource "aws_ecs_task_definition" "app" {
  family                   = "myapp-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions    = data.template_file.nginx_app.rendered
  
  # defined in role.tf
  #task_role_arn = aws_iam_role.app_role.arn
}


resource "aws_ecs_service" "main" {
  name            = "myapp-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = data.aws_subnet_ids.subnet.ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "myapp"
    container_port   = 80
  }

  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]
}