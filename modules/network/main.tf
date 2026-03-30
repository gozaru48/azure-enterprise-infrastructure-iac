# ==========================================
# Network Module: ネットワークの部品
# ==========================================

# 1. リソースグループ（土地の確保）
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# 2. 仮想ネットワーク（構内の定義）
resource "azurerm_virtual_network" "main" {
  name                = "vnet-enterprise-prod"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# 3. サブネット（部署ごとの区画）
resource "azurerm_subnet" "internal" {
  name                 = "snet-internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 4. ネットワークセキュリティグループ（門番）
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

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# 5. NSGをサブネットに関連付け
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# 6. パブリックIP（外からの入り口）
resource "azurerm_public_ip" "pip" {
  name                = "pip-web-prod"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}