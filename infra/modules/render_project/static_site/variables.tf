variable "static_sites" {
    type = any
}

variable "secrets_map" {
    type = map(string)
    description = "A map of secrets to be used in the static sites"
    default = {}
    sensitive = true
}