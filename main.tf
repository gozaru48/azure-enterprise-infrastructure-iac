# ==========================================
# 1. Management Layer: Resource Group
# ==========================================
resource "azurerm_resource_group" "example" {
  name     = "rg-enterprise-prod"
  location = "southeastasia" # 安定のシンガポールリージョン
}

# ==========================================
# 2. Network Layer: VNet & Subnet
# ==========================================
resource "azurerm_virtual_network" "main" {
  name                = "vnet-enterprise-prod"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "snet-internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ==========================================
# 3. Security Layer: NSG & Public IP
# ==========================================
# Zero Trust: Port 22 (SSH) のみを許可する厳格なルール
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

# NSGをサブネットに関連付け
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# エンタープライズ向けの Standard SKU IP
resource "azurerm_public_ip" "pip" {
  name                = "pip-web-prod"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard" 
}

# ==========================================
# 4. Compute Layer: Linux Virtual Machine
# ==========================================
resource "azurerm_network_interface" "nic" {
  name                = "nic-web-prod"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-linux-prod"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_D2s_v3" # 在庫が安定しており高性能なサイズ
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  # SSHキー認証（Security by Design）
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}