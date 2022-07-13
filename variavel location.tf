variable "name-rg" {
  type        = string
  description = "Nome do Resource Group"
  default     = "rg-variaveis"
}
variable "location" {
  type        = string
  description = "localizacao dos recursos do azure. ex: brazilsouth"
  //default     = "eastus"
}
variable "tags" {
  type        = map(any)
  description = "tags nos recursos e servicos do azure"
  default = {
    ambiente    = "desenvolvimento"
    responsavel = "Julio Cesar"
  }
}
variable "vnetenderecos" {
  type    = list(any)
  default = ["10.0.0.0.24", "192.168.0.0/16"]
}
//variaveis
