# 0. Resource Group Configuration
# The foundational container for all infrastructure resources.
resource "azurerm_resource_group" "example" {
  name     = "rg-enterprise-prod"
  location = "Australia East"  #Sydeny region 
}


# 1. Virtual Network (VNet) Configuration
# Designing the primary network boundary for enterprise-grade resources.
resource "azurerm_virtual_network" "main" {
  name                = "vnet-enterprise-prod"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# 2. Subnet Configuration
# Isolating resources within a dedicated internal subnet for improved traffic management.
resource "azurerm_subnet" "internal" {
  name                 = "snet-internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 3. Network Security Group (NSG) - Security Layer
# Demonstrating AZ-500 principles by implementing a Zero Trust inbound rule.
# Only SSH (Port 22) is allowed for secure administrative access.
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-web-prod"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# 4. NSG to Subnet Association
# Enforcing the security group rules at the subnet level to harden the environment.
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}