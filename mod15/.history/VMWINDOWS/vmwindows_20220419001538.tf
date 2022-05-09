
provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "rg" {
    name = "Estagio-AK"
    location = "northeurope"
}

resource "azurerm_virtual_network" "vnet" {
  name =  "vmwinserver-vnet"
  address_space = ["10.0.0.0/16", "192.168.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name = "vmwinserver-subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.2.0/22"]
}

resource ""azurerm_public_ip"" "publicip" {
    name = "vmwinserver_ippublic"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Dynamic"
    idle_timeout_in_minutes = 30
    domain_name_label = "vmwinservertf"
}


resource "azurerm_network_interface" "nic" {
    name = "vmwinserver-nic"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
   
    ip_configuration {
      name = "ipexterno-config"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.id 
    }
}