resource "aws_ecs_task_definition" "task_definition" {
    family = var.task_definition.family

    container_definitions = jsonencode([{
        name = var.task_definition.name
        image = var.task_definition.image
    }])

}




module "service" {
    source = "./service"
    task_definition_arn = aws_ecs_task_definition.task_definition.arn

    providers = {
        aws.east = aws.east
    }
}



