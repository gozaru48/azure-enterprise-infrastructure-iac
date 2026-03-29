# Configure the Azure Provider
# This block tells Terraform which cloud and version to use.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}


provider "azurerm" {
  features {}

  # これを追加：古い認証方式との互換性を保つため
  storage_use_azuread = false
}