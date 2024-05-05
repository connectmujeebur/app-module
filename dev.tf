terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

module "module_dev" {
    source = "./modules"
    prefix = "dev"
    environment = "dev"
    location = "eastus"
    rg_name = "dev-rg-2024"
    app_name = "dev-app1-2024"
    subnet_name = "dev-subnet-2024"
    virtual_network_name = "dev-vnet-2024"
    app_service_slot_name = "dev-slot-2024"
    app_service_plan_name = "dev-api-appserviceplan-pro"
    dotnet_version = "v4.0"
    tier = "Standard"
    size = "S1"
    address_space = "10.0.0.0/16"
    address_prefixes = "10.0.1.0/24"
    subscription_id = "3229d325-9b1c-49f8-9601-4b44109c0d1f"
}