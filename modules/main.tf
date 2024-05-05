provider "azurerm" {
  features {}

# we have better option to to avoid giving secrets like this

  subscription_id = var.subscription_id
  client_id       = "2cd121f8-c290-4683-b223-788268ad1714"
  tenant_id       = "d26a657f-22cc-48ff-9da2-31c89f842f91"
  client_secret   = "EJT8Q~ppyjOrMbYzNOMwRAupCxqN.3Rhj~06vdnT"
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_app_service_plan" "asp1" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "app1" {
  name                = var.app_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  app_service_plan_id = azurerm_app_service_plan.asp1.id
  https_only          = true
  enabled             = true

  site_config {
    dotnet_framework_version = var.dotnet_version
    min_tls_version          = "1.2"
    always_on                = true

    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.example.id
    }
  }
}

resource "azurerm_app_service_slot" "appslot" {
  name                = var.app_service_slot_name
  app_service_name    = azurerm_app_service.app1.name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  app_service_plan_id = azurerm_app_service_plan.asp1.id
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["${var.address_space}"]
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["${var.address_prefixes}"]
  service_endpoints    = ["Microsoft.Web"]
  delegation {
    name = "AppServiceDelegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "example" {
  slot_name      = azurerm_app_service_slot.appslot.name
  subnet_id      = azurerm_subnet.example.id
  app_service_id = azurerm_app_service.app1.id
}

output "slot_virtual_network_swift_connection_id" {
  value = azurerm_app_service_slot_virtual_network_swift_connection.example.id
}
