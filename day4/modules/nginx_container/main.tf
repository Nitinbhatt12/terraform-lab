terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# ✅ Variables (as per assignment)
variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "Image_name" {
  type = string
}

# ✅ Resource (using variables)
resource "docker_container" "nginx" {
  name  = var.container_name
  image = var.Image_name

  ports {
    internal = 80
    external = var.container_port
  }
}