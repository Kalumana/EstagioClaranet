provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "grupo-recurso" {
  location = "northeurope"
  name = "rg-terraform-mod5"
  tags = {
      date = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
      ambiente = lower("Homologacao")
      responsavel= upper("Antonio Kalumana")
      tecnologia = title("terraform")
  }
}


variable "vnteips" {
    type = list 
    default = ["10.0.0.0/16"]
  
}
resource "azurerm_virtual_network" "vnet" {
    name = "vnetestagioazure"
    location = "northeurope"
    resource_group_name = "rg-terraform-mod5"

    address_space = concat(var.vnteips, ["192.168.0.0/16"])
    #Usando condições, Se não existir ips atribui 2 ips
    # address_space = lengh(var.vnetips)==0 ? ["10.0.0.0/16", "192.168.0.0/16"] . var.vnetips  
}

output "vnet-numeroips" {
  value = lenght("${azurerm_virtual_network.vnet.address_space}")
}


    #Condições

