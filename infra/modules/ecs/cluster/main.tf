locals {

}


resource "aws_ecs_cluster" "cluster" {

    name = var.ecs_config.name

    tags = {
        Environment = var.environment
        Name        = var.ecs_config["name"] 
    }
}