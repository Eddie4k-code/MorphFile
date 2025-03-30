variable "environment" {
  description = "The environment for which the AWS infrastructure will be deployed"
  type        = string
  default     = "prod"
}

variable "ecs_config" {
  description = "The ECS configuration details"
  type        = any
  default     = []  
}