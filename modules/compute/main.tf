# ==========================================
# Compute Module: コンピューティングの部品
# ==========================================

# 1. NIC (ネットワークインターフェース)
resource "azurerm_network_interface" "nic" {
  name                = "nic-web-prod"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    # 【重要】ネットワーク部から受け取ったIDを変数で指定
    subnet_id                     = var.subnet_id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

# 2. Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-linux-prod"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
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

  custom_data = base64encode(<<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  )
}

#3. 通知先の設定（Action Group）
resource "azurerm_monitor_action_group" "main" {
  name                = "CriticalAlerts"
  resource_group_name = var.resource_group_name
  short_name          = "prio1"

  depends_on = [azurerm_linux_virtual_machine.vm]

  email_receiver {
    name          = "admin"
    email_address = "your-email@example.com" # 自分のアドレスに変更
  }
}

#4. CPU 80% 監視アラート
resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "vm-cpu-alert"
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_linux_virtual_machine.vm.id] # VMのIDを参照
  description         = "Action will be triggered when CPU percentage is greater than 80."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}