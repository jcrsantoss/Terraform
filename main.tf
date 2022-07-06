provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "Grupo-recurso" {
  count    = 5 // <<<quantidade de grupos de recursos que será criado!!
  location = "brazilsouth"
  name     = "rg-terraform-mod5-${count.index}"
  tags = {
    data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Ambiente    = lower("homologacao")
    responsavel = upper("julio cesar rocha pereira dos santos")
    tecnologia  = title("terraform")
  }
}

variable "vnetips" {
  type    = list(any)
  default = ["10.0.0.0/8"]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnettreinamentoazure"
  location            = "brazilsouth"
  resource_group_name = "rg-terraform-mod5-1" //<<< inicio do grupo de recurso

  address_space = length(var.vnetips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnetips
}
output "vnet-numeroips" {
  value = length("${azurerm_virtual_network.vnet.address_space}")
}
