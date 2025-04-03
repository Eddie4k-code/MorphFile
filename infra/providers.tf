terraform {
  required_providers {

    render = {
      source  = "render-oss/render"
      version = "~> 1.6.0" # Specify the version of the Render provider
    }
  }
}




provider "render" {
  api_key = var.api_key
  owner_id = var.owner_id
}
