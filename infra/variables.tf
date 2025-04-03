variable "environment" {
    description = "The environment for which the infrastructure is being deployed (e.g., dev, staging, prod)"
    type        = string
    default     = "prod" # Default value can be overridden when running Terraform
}
