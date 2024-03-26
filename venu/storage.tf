#to create storage account
resource "azurerm_storage_account" "storage" {
  name                     = "rockykgf9000908"
  resource_group_name      = azurerm_resource_group.RG.name
  location                 = azurerm_resource_group.RG.location
  account_tier             = var.acc-tier
  account_replication_type = var.ar-type

}
resource "azurerm_storage_container" "cont1" {
  name                  = "rocky"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.acc-type
}