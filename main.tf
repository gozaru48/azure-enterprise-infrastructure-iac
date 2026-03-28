# Create a Resource Group
# Naming Convention: rg-<project>-<environment>-<region>-###
resource "azurerm_resource_group" "main" {
  name     = "rg-enterprise-prod-australiaeast-001"
  location = "Australia East"

  tags = {
    Environment = "Production"
    Owner       = "Yusuke"
    Project     = "CloudMigration"
  }
}