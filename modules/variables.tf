

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Location to deploy the resource group"
  default     = "eastus"
}


variable "rg_name" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "rg-2024"
}

variable "plan_sku" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "S1"
}
variable "app_name" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "app1-2024"
}

variable "subscription_id" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "3229d325-9b1c-49f8-9601-4b44109c0d1f"
}
variable "subnet_name" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "subnet-2024"
}
variable "virtual_network_name" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "vnet-2024"
}
variable "app_service_slot_name" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "slot-2024"
}
variable "app_service_plan_name" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "api-appserviceplan-pro"
}
variable "dotnet_version" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "v4.0"
}
variable "tier" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "Standard"
}
variable "size" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "S1"
}
variable "address_space" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "10.0.0.0/16"
}

variable "address_prefixes" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "10.0.1.0/24"
}
variable "prefix" {
  type        = string
  description = "The tier of app service plan to create"
}