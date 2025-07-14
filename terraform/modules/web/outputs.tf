# output "details" {
#   value = <<CUSTOM_OUTPUT
# ################### ${var.env} #######################
# Resource Group Name = ${azurerm_resource_group.rg.name}
# MySQL server Name = ${azurerm_mysql_flexible_server.mysql.name}
# Load Balancer IP = ${azurerm_public_ip.pip.ip_address}
# Web Server Private IPs
# ${azurerm_linux_virtual_machine.web[0].name} = ${azurerm_linux_virtual_machine.web[0].private_ip_address}
# ${azurerm_linux_virtual_machine.web[1].name} = ${azurerm_linux_virtual_machine.web[1].private_ip_address}
# ######################################################
# CUSTOM_OUTPUT  
# }

output "name" {
  value = azurerm_resource_group.rg.name
}

output "mysql_name" {
  value = azurerm_mysql_flexible_server.mysql.name
}

output "lb_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "web_private_ips" {
  value = {
    for vm in azurerm_linux_virtual_machine.web : vm.name => vm.private_ip_address
  }
}

output "web_vms" {
  value = azurerm_linux_virtual_machine.web[*].name
}

output "web_vms_private_ips" {
  value = azurerm_linux_virtual_machine.web[*].private_ip_address
}
