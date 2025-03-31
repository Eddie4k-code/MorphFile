module "cluster" {
    source = "./cluster"

    providers = {
        aws.east = aws.east
    }

    environment = var.environment
    ecs_config = var.ecs_config
}


module "task_definition" {
    source = "./task_definition"

    for_each = {
        for task in try(var.ecs_config.task_definitions, []) : 
          task.name => task
    }

    task_definition = each.value

    providers = {
        aws.east = aws.east
    }
}






