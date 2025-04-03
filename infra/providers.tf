terraform {
  required_providers {

    render = {
      source  = "render-oss/render"
      version = "~> 1.6.0" # Specify the version of the Render provider
    }
  }
}




provider "render" {
  api_key = "rnd_VdP2x2flQso4PrthAiOFVzWUYzqu"
  owner_id = "eddie4k"
}
