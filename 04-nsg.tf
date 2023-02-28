resource "azurerm_network_security_group" "do4m-ado-nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.do4mado.location
  resource_group_name = azurerm_resource_group.do4mado.name
}

resource "azurerm_network_security_rule" "example" {
  name                        = "ssh-allow"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.do4mado.name
  network_security_group_name = azurerm_network_security_group.do4m-ado-nsg.name
}

resource "azurerm_network_interface_security_group_association" "do4m-ado-nic-nsg" {
  network_interface_id      = azurerm_network_interface.do4m-ado-nic.id
  network_security_group_id = azurerm_network_security_group.do4m-ado-nsg.id
}