data "azurerm_resource_group" "example" {
  name     = "datarg"

}
data "azurerm_subnet" "example" {
    resource_group_name = "datarg"
    virtual_network_name = "datarg-vnet"
  name                 = "default"
}
resource "azurerm_network_interface" "example" {
  name                = "data-nic1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}