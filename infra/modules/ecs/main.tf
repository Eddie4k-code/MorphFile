module "cluster" {
    source = "./cluster"

    providers = {
        aws.east = aws.east
    }

    environment = var.environment
    ecs_config = var.ecs_config
}





