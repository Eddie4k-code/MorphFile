# This is the main Terraform configuration file for the infrastructure.
# It defines the provider and module configurations for different regions.
module "us-east-1" {
  source = "./modules/us-east-1"
    providers = {
        aws = aws.east
    }
}


locals {
  #debugging purposes

   # Fetch Configurations defined in the YAML file for the environment
    configurations = yamldecode(file("./prod/prod.yml"))

    # Group the configurations by resource type for easier access
    configurations_by_resource = [
        for obj in local.configurations : obj
    ]
}