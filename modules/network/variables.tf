# ==========================================
# Network Module Variables: 本部からの受け取り口
# ==========================================

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}