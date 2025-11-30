 terraform {
  backend "azurerm" {
    resource_group_name  = "hexademo-rg"
    storage_account_name = "hexademostorage123"
    container_name      = "tfstate"
    key                 = "terraform.tfstate"
  }
}