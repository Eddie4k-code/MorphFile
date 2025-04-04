variable "services" {
    description = "A list of services to be created. Each service should be a map with required attributes."
    type = list(object({
        name        = string
        plan        = string
        region      = string
        environment_id = string
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