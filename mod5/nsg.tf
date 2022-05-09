resource "azurerm_resource_group" "vnetrg" {
  location = "northeurope"
  name = "vnetrg"
}

resource "azurerm_network_security_group" "nsg" {
  name = "nsg-estagio"
  location = "northeurope"
  resource_group_name = "vnetrg"
  depends_on = [
      azurerm_resource_group.vnetrg ] 
}


variable "regras_entrada" {
    type = map 
    description = " Lista de portas de entrada no NSG"
    default = {
        101=80 
        102 =443
        103 = 3389
        104 = 22
    }
}
resource "azurerm_network_security_rule" "regras_entrada_liberadas" {
  for_each = var.regras_entrada
  resource_group_name = "vnetrg"
  name = "portaentrada_${each.value}"
  priority = each.key
  destination_port_range = each.value
  direction = "Inbound"
  access = "Allow"
  source_port_range = "*"
  protocol = "TCP"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  network_security_group_name = "nsg-estagio"

}