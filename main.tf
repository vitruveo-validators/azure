# 1. Deploys a Ubuntu 23.10 Validator in Azure runing 4 cores, 8G RAM (Standard_F4s_v2)
# 2. Increases the single Ubuntu volume to a 256GB Premium SSD disk.
# 3. Creates and downloads a Private key (validator.pem) in the folder you ran Terraform from.
# 4. Deploys a static highly available Public IP in Azure.
# 5. Creates a vNIC attached to the validator with fast Accelerated networking enabled for better performance.

# az account list-locations --query "sort_by([].{Location:name}, &Location)" -o table


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

# Creates a resource group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "rg-validator"
}

# Create virtual network
resource "azurerm_virtual_network" "validator_network" {
  name                = "vnet-validator"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a subnet
resource "azurerm_subnet" "validator_subnet" {
  name                 = "sn-validator"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.validator_network.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Create public IPs with HA 
resource "azurerm_public_ip" "validator_public_ip" {
  name                = "pip-validator"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  availability_zone   = "Zone-Redundant"
}

# Create Network Security Group for inbound Validator ports
resource "azurerm_network_security_group" "validator_nsg" {
  name                = "nsg-validator"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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
    name                       = "30304"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "30304"
    destination_port_range     = "30304"
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
    security_rule {
    name                       = "8545-2"
    priority                   = 1006
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "8545"
    destination_port_range     = "8545"
    source_address_prefix      = "52.9.31.55/32"
    destination_address_prefix = "*"
}

# Creates a network interface with Accelerated networking enabled
resource "azurerm_network_interface" "validator_nic" {
  name                = "nic-validator"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "nic-validator"
    subnet_id                     = azurerm_subnet.validator_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.validator_public_ip.id
  }
}

# Connects the NSG to the vNIC
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.validator_nic.id
  network_security_group_id = azurerm_network_security_group.validator_nsg.id
}

# Creates a Ubuntu virtual machine
resource "azurerm_linux_virtual_machine" "validator_vm" {
  name                   = "validator"
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  network_interface_ids  = [azurerm_network_interface.validator_nic.id]
  size                   = var.vm_size
  #size                  = Standard_DS1_v2 or Standard_F4s_v2
  admin_username         = "validatoradmin"
  computer_name          = "validator"
  secure_boot_enabled    = "true"

admin_ssh_key {
    username             = "validatoradmin"
    public_key           = tls_private_key.validator_key.public_key_openssh
  }

  os_disk {
    name                 = "disk-validator"
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
   filename="validator.pem"
   content=tls_private_key.validator_key.private_key_pem
}           

