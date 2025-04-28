output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "connection_string" {
  value     = "Server=${azurerm_mssql_server.sql_server.fully_qualified_domain_name};Database=${azurerm_mssql_database.sql_db.name};User ID=sqladmin;Password=P@ssw0rd1234!;"
  sensitive = true
}
