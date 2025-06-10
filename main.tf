terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

variable "do_access_token" {
  description = "Digital ocean access token"
  type        = string
  default     = ""
}

variable "do_project_name" {
  description = "Digital ocean project name"
  type        = string
  default     = ""
}

variable "do_project_description" {
  description = "Digital ocean project description"
  type        = string
  default     = ""
}

provider "digitalocean" {
  token = var.do_access_token
}

# Create project
resource "digitalocean_project" "playground" {
  name        = var.do_project_name
  description = var.do_project_description
  purpose     = "Web Application"
  environment = "Development"
}