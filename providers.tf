terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      # リソースが残っていてもRGごと削除を許可する設定（検証効率化）
      prevent_deletion_if_contains_resources = false
    }
  }
  storage_use_azuread = false
}