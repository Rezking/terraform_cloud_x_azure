resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

data "azurerm_ssh_public_key" "vm_key" {
  name                = "vm_key"
  resource_group_name = var.rg_name
}
resource "azurerm_virtual_network" "VNet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = var.vnet_address
}

resource "azurerm_subnet" "Ore_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.VNet.name
  address_prefixes     = var.subnet_addr
}

resource "azurerm_network_interface" "Ore_nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "rez"
    subnet_id                     = azurerm_subnet.Ore_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm_resource" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  admin_username      = var.username
  network_interface_ids = [
    azurerm_network_interface.Ore_nic.id
  ]

  size = "Standard_B1s"
  admin_ssh_key {
    username   = var.username
    public_key = data.azurerm_ssh_public_key.vm_key.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}