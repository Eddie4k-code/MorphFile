variable "environment" {
    description = "The environment for which the infrastructure is being deployed (e.g., dev, staging, prod)"
    type        = string
    default     = "prod" # Default value can be overridden when running Terraform
}

variable "api_key" {
    description = "API key for Render provider"
    type        = string
    sensitive   = true # Mark as sensitive to avoid logging the value in Terraform output
}

variable "owner_id" {
    description = "Owner ID for the resources"
    type        = string
    default     = "default_owner" 
}