terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# ✅ Variable
variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))
}

# ✅ Dynamic module call
module "nginx_containers" {
  source = "./modules/nginx_container"

  for_each = {
    for c in var.container_config :
    c.name => c
  }

  container_name = each.value.name
  container_port = each.value.port
  Image_name     = "nginx:latest"
}

# ✅ Output
output "container_urls" {
  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]
}