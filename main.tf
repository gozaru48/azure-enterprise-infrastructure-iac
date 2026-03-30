# ==========================================
# Root Module: 司令塔
# ==========================================

# 1. ネットワークモジュールの呼び出し
module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# 2. コンピューティングモジュールの呼び出し
module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  
# 【ここが重要！】ネットワークモジュールから出力された値を受け取って渡す
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_address_id

}
