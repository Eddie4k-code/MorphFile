variable "clusters" {
    description = "A list of ECS cluster names to be created."
    type        = list(map(any))
    default     = []
}

variable "environment" {
    description = "The environment for which the AWS infrastructure will be deployed."
    type        = string
    default     = "prod"
}