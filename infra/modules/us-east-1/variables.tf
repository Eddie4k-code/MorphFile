variable "environment" {
  description = "The environment for which the configurations are being applied (e.g., dev, staging, prod)"
  type        = string
  default     = "prod"
}