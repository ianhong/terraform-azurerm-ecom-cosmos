resource "azurerm_resource_group" "ihong-lab-rg" {
  location = "westus"
  name     = "ihong-lab-rg"
}

resource "azurerm_cosmosdb_account" "cosmos_account" {
  enable_free_tier    = true
  ip_range_filter     = local.ip_range
  location            = "westus"
  name                = "oms-${var.db_name}"
  enable_free_tier    = false

  offer_type          = "Standard"
  resource_group_name = azurerm_resource_group.ihong-lab-rg.name

  consistency_policy {
    consistency_level = "Session"
  }

  tags = var.common_tags

  geo_location {
    failover_priority = 0
    location          = "westus"
  }

  depends_on = [
    azurerm_resource_group.ihong-lab-rg,
  ]
}
resource "azurerm_cosmosdb_sql_database" "cosmos_db" {
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  name                = "cosmicworks"
  resource_group_name = azurerm_resource_group.ihong-lab-rg.name 
  depends_on = [
    azurerm_cosmosdb_account.cosmos_account,
  ]
}
