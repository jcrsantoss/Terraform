provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "Grupo-recurso" {
  location = "brazilsouth"
  name     = "rg-terraform-mod5"
  tags = {
    data = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Ambiente = lower ("homologacao")
    responsavel = upper ("julio cesar rocha pereira dos santos")
    tecnologia = title ("terraform")    
  }
}

variable "vnetips" {
type = list
default = ["10.0.0.0/16"]  
}

resource "azurerm_virtual_network" "vnet" {
name = "vnettreinamentoazure"
location = "brazilsouth"
resource_group_name = "rg-terraform-mod5"

address_space = concat(var.vnetips, ["192.168.0.0/16"])
}
output "vnet-numeroips" {
  value = length("${azurerm_virtual_network.vnet.address_space}")
}