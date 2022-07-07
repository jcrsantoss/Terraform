
  
resource "azurerm_resource_group" "vnetrg" {
  location = "brazilsouth"
  name     = "vnetrg"
}
resource "azurerm_network_security_group" "nsg" {
  name                = "treinamento-nsg"
  location            = "brazilsouth"
  resource_group_name = "vnetrg"
  depends_on = [
  azurerm_resource_group.vnetrg
      ]

}
variable "regras_entradas" {
  type        = map(any)
  description = "lista de portas de entrada liberadas no NSG"
  default = {
    101 = 80
    102 = 443
    103 = 3389
    104 = 22
  }
}

resource "azurerm_network_security_rule" "regras_entrada_liberada" {
  for_each                    = var.regras_entradas
  resource_group_name         = "vnetrg"
  name                        = "Portaentrada_${each.value}"
  priority                    = each.key
  destination_port_range      = each.value
  direction                   = "Inbound" //necessario letras maiscula 
  access                      = "Allow"   //necessario letras maiscula 
  source_port_range           = "*"
  protocol                    = "Tcp" //necessario letras maiscula 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = "treinamento-nsg"

}
