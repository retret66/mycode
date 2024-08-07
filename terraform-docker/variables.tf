# This is my  variables.tf

# Define a variable for the internal port with a default value
variable "internal_port" {
  description = "The internal port the container will use"
  type        = number
  default     = 9876
}



# Define a variable for the external port with a default value
variable "external_port" {
  description = "The external port to map to the internal port"
  type        = number
  default     = 5432
}


# Define a variable for the container name with a default value
variable "container_name" {
  description = "The name of the Docker container"
  type        = string
  default     = "Alta3ResearchWebService"
}
