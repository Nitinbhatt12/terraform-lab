terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# First container
module "web1" {
  source = "./modules/nginx_container"

  container_name = "web1"
  container_port = 8081
  Image_name     = "nginx:latest"
}

# Second container
module "web2" {
  source = "./modules/nginx_container"

  container_name = "web2"
  container_port = 8082
  Image_name     = "nginx:latest"
}