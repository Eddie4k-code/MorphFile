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

variable "BACKEND_API_URL" {
    type = string
    description = "The backend API URL to be used in the Render project"
    default = ""
}

variable "FILE_CONVERTER_API_SECRET" {
    type = string
    description = "The secret for the file converter API"
    default = ""
}
