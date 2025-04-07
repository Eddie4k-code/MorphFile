variable "services" {
    description = "A list of services to be created. Each service should be a map with required attributes."
    type = list(object({
        name        = string
        plan        = string
        region      = string
        runtime_source = map(any)
    }))
    default     = []
    sensitive   = false
}

variable "project_name" {
    description = "The name of the Render project to which the services belong."
    type        = string
    default     = ""
    sensitive   = false
}

variable "secrets_map" {
    description = "A map of secrets to be used in the services"
    type        = map(string)
    default     = {}
    sensitive   = true
}

