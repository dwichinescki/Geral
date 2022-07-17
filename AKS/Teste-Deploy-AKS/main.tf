# The Azure Provider can be used to configure infrastructure in Microsoft Azure using the Azure Resource Manager API's. 
# Documentation regarding the Data Sources and Resources supported by the Azure Provider can be found in the navigation to the left.
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  # (Required) A features block as defined below which can be used to customize the behaviour of certain Azure Provider resources.
  features {}

  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
}

# https://www.terraform.io/docs/backends/types/azurerm.html
# Stores the state as a Blob with the given Key within the Blob Container within the Blob Storage Account. 
# This backend also supports state locking and consistency checking via native capabilities of Azure Blob Storage.
# terraform {
#   backend "azurerm" {
#     # (Required) The Name of the Resource Group in which the Storage Account exists.
#     resource_group_name  = "Azure_Terraform"
#     # (Required) The Name of the Storage Account.
#     storage_account_name = "prbterraformhomolog"
#     # (Required) The Name of the Storage Container within the Storage Account.
#     container_name       = "tfstate"
#     # (Required) The name of the Blob used to retrieve/store Terraform's State file inside the Storage Container.
#     key                  = "devops/aks-pega/development.tfstate"
#   }
# }