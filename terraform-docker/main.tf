# This is my main.tf 

# Specify the required Terraform version
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"  # Specify version...
    }
  }
}

# Specify the Terraform provider for Docker
provider "docker" {
  # No additional configuration is needed for the Docker provider
}

# Define the Docker image resource block
resource "docker_image" "simplegoservice" {
  name = "registry.gitlab.com/alta3/simplegoservice"
}

# Define the Docker container resource block
resource "docker_container" "simplegoservice_container" {
  name  = var.container_name
  image = docker_image.simplegoservice.name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
