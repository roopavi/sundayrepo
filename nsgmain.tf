resource "azurerm_resource_group" "rg" {
  name     = "rgaddale1"
  location = "south india"
}
resource "azurerm_virtual_network" "vnet" {
  name                = "vn20"
  address_space       = ["11.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "snet" {
  name                 = "snet20"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.2.0/24"]
}
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg20"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "test012345"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "ansg" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_resource_group" "rg1" {
  name     = "rgaddale22"
  location = "south india"
}
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet21"
  address_space       = ["11.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg1.name
}
resource "azurerm_subnet" "snet1" {
  name                 = "snet21"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["11.0.2.0/24"]
}
resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg21"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg1.name

  security_rule {
    name                       = "test123456"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "ansg1" {
  subnet_id                 = azurerm_subnet.snet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}
