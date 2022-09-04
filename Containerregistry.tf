provider "azurerm" {
  features {
    
  }
}


resource "azurerm_resource_group" "rg" {
  name = "rg-acr"
  location = "brasilsouth"
}

  resource "azure_container_registry" "acr" {
    name              ="acregistrytf"
    resource_group_name= azurerm_resource_group.rg.name
    location          = azurerm_resource_group.rg.location
    sku               ="basic"
    admin_enabled     =true
}

output "admin-usuario" {
    value = azurerm_container_registry.acr.admin_username
}

output "admin-senha" {
    value = azurerm_container_registry.acr.admin_password
  
}
