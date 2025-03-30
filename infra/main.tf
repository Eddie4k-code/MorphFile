# This is the main Terraform configuration file for the infrastructure.
# It defines the provider and module configurations for different regions.
module "us-east-1" {
  source = "./modules/us-east-1"
    providers = {
        aws = aws.east
    }
}


locals {
 
}