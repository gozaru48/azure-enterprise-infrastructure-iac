# ==========================================
# Root Variables: 司令塔（本部）が使う変数
# ==========================================

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "southeastasia"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-enterprise-prod"
}

variable "vm_size" {
  description = "VM Size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin User"
  type        = string
  default     = "azureuser"
}