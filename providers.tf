terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

#create state
backend "azurerm" {
  resource_group_name = "tfstate-rg"
  storage_account_name = "tfstateyusuke4946"
  container_name     = "tfstate"
  key   =  "terraform.tfstate"  #file name 
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