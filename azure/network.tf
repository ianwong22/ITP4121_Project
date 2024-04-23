# Create a virtual network within the resource group
resource "azurerm_virtual_network" "itp4121-network" {
  name                = "itp4121-network"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "itp4121-subnet1"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.itp4121-network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "itp4121-subnet2"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.itp4121-network.name
  address_prefixes     = ["10.0.0.0/24"]
}

