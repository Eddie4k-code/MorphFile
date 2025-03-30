locals {

    clusters_mapped = {
        for cluster in var.clusters : cluster.name => cluster
    }

}


resource "aws_ecs_cluster" "clusters" {
    for_each = local.clusters_mapped

    name = each.value.name

    tags = {
        Environment = var.environment
        Name        = each.value.name
    }
}