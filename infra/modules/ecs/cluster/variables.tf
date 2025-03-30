variable "ecs_config" {
    description = "The ECS configuration details for creating ECS clusters. This should be a list of maps containing the necessary attributes for each ECS cluster."
    type        = any
    default     = []
}

variable "environment" {
    description = "The environment for which the AWS infrastructure will be deployed."
    type        = string
    default     = "prod"
}