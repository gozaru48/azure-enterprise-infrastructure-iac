output "subnet_id" {
  value = azurerm_subnet.internal.id
}

output "public_ip_address_id" {
  value = azurerm_public_ip.pip.id
}