provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">=1.3.2"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}