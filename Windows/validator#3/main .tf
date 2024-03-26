# This Terraform script is ONLY for validator #2 - after running Terraform to deploy validator #1

# 1. Deploys a Ubuntu 23.10 Validator in Azure runing 4 cores, 8G RAM (Standard_F4s_v2)
# 2. Increases the single Ubuntu volume to a 256GB Premium SSD disk.
# 3. Creates and downloads a Private key (validator2.pem) in the folder you ran Terraform from.
# 4. Deploys a static highly available Public IP in Azure.
# 5. Creates a vNIC attached to the validator with fast Accelerated networking enabled for better performance.


terraform {
  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "rg-validator"
}

data "azurerm_virtual_network" "validator_network" {
  name                = "vnet-validator"
  resource_group_name = "rg-validator"
}

data "azurerm_subnet" "validator_subnet" {
  name                 = "sn-validator"
  virtual_network_name = "vnet-validator"
  resource_group_name  = "rg-validator"
}

resource "azurerm_public_ip" "validator_public_ip" {
  name                = "pip-validator2"
  location            = var.resource_group_location
  resource_group_name = "rg-validator"
  allocation_method   = "Static"
  sku                 = "Standard"
  availability_zone   = "Zone-Redundant"
}

resource "azurerm_network_security_group" "validator_nsg" {
  name                = "nsg-validator2"
  location            = var.resource_group_location
  resource_group_name = "rg-validator"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "8545"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "8545"
    destination_port_range     = "8545"
    source_address_prefix      = "52.9.172.122/32"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "30303"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "30303"
    destination_port_range     = "30303"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "443"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "80"
    priority                   = 1005
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "validator_nic" {
  name                = "nic-validator2"
  location            = var.resource_group_location
  resource_group_name = "rg-validator"
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "nic-validator2"
    subnet_id                     = data.azurerm_subnet.validator_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.validator_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.validator_nic.id
  network_security_group_id = azurerm_network_security_group.validator_nsg.id
}

resource "azurerm_linux_virtual_machine" "validator_vm" {
  name                   = var.name
  location               = var.resource_group_location
  resource_group_name    = "rg-validator"
  network_interface_ids  = [azurerm_network_interface.validator_nic.id]
  size                   = var.vm_size
  admin_username         = "validatoradmin"
  computer_name          = "validator2"
  secure_boot_enabled    = "true"

admin_ssh_key {
    username             = "validatoradmin"
    public_key           = tls_private_key.validator_key.public_key_openssh
  }

  os_disk {
    name                 = "disk-validator2"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = "256"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-mantic"
    sku       = "23_10-gen2"
    version   = "latest"
  }
  
}
resource "tls_private_key" "validator_key" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "local_file" "validator_key"{
   filename="validator2.pem"
   content=tls_private_key.validator_key.private_key_pem
}           

