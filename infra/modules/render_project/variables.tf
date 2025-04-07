variable "render_project" {
    type = any
}


variable "secrets_map" {
    type = map(string)
    description = "A map of secrets to be used in the render project"
    default = {}
    sensitive = true
}

