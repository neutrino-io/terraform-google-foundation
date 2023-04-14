terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.61"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.61"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}
