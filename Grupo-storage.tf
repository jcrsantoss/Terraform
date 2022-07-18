terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "tstateaztreinamento"
    container_name       = "terraformstate"
    key                  = "b9GGF/dJAkoUUQX4CW31xzZyggtH3wbaFHa4nK4EEyRxMDyiCFixFZ++T5Fz5Ut1QBTkxSTcy+PH+ASthDZf5A=="
  }
}

provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "RG-state" {
  name     = "rg_terraform_com_state"
  location = "brazilsouth"
}
