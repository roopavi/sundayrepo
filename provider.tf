provider "azurerm" {
  features {}
  version         = "=2.46.0"
  subscription_id = "eb3968fe-3761-4c75-94e5-0e8c95e5e4c9"
  client_id       = "749f3099-215c-40f5-9a6c-2558e4b0ae0e"
  client_secret   = "p7MZMtRmGj2f25Q~40Mem0~.qGcux22-__"
  tenant_id       = "7829b58f-8707-4a6d-bf5f-d8f7ac3c18ea"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "rg1_storage"
    storage_account_name = "grsvstorageaccount"
    container_name       = "containergrsv"
    key                  = "nsg.terraform.containergrsv"
    access_key           = "TFsU9Xd1Bsvh6NMwToaOFFF+wqunmiHctyaTLYHHmg6QKfwESISEhApkKRSD2nIabEINr6kWdcbHp7hgTsPpcw=="
  }
}