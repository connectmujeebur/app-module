
module "module_prod" {
    source = "./modules"
    environment = "prod"
    location = "eastus"
    rg_name = "prod-rg-2024"
    app_name = "prod-app1-2024"
    subnet_name = "prod-subnet-2024"
    virtual_network_name = "prod-vnet-2024"
    app_service_slot_name = "prod-slot-2024"
    app_service_plan_name = "prod-api-appserviceplan-pro"
    dotnet_version = "v4.0"
    tier = "Standard"
    size = "S1"
    address_space = "10.20.0.0/16"
    address_prefixes = "10.20.1.0/24"
    prefix = "prod"
    subscription_id = "3229d325-9b1c-49f8-9601-4b44109c0d1f" 

}