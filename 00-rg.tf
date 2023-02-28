# Resource Group
resource "azurerm_resource_group" "do4mado" {
  name     = var.rg_name
  location = var.location
}