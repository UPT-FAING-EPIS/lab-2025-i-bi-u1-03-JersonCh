provider "azurerm" {
  features {}
  subscription_id = "37b22429-d75b-401b-a09c-de8a04575609"
}

resource "azurerm_resource_group" "rg" {
  name     = "lab03-sql-rg-jerson"
  location = "brazilsouth"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "sql-srv-jerson-lab03"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
  public_network_access_enabled = true
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "sql_db" {
  name               = "adventureworkslt-db-jerson"
  server_id          = azurerm_mssql_server.sql_server.id
  collation          = "SQL_Latin1_General_CP1_CI_AS"
  sku_name           = "Basic"
  max_size_gb        = 2
  auto_pause_delay_in_minutes = 60
}
