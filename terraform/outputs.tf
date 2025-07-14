# output "hub" {
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

# output "web" {
#   value = <<CUSTOM_OUTPUT
# ######################################################
# Resource Group Name = ${azurerm_resource_group.hub.name}
# VENT Name = ${azurerm_virtual_network.vnet.name}
# VNET ID = ${azurerm_virtual_network.vnet.id}
# Front Door Name = ${azurerm_cdn_frontdoor_profile.fd.name}
# Production Endpoint ID = ${azurerm_cdn_frontdoor_endpoint.prod-endpoint.id}
# Production Origin Group ID = ${azurerm_cdn_frontdoor_origin_group.prod_origin_group.id}
# PreProduction Endpoint ID = ${azurerm_cdn_frontdoor_endpoint.preprod-endpoint.id}
# PreProduction Origin Group ID = ${azurerm_cdn_frontdoor_origin_group.preprod_origin_group.id}
# Netapp Account Name = ${azurerm_netapp_account.netapp_account.name}
# Netapp Pool Name = ${azurerm_netapp_pool.netapp_pool.name}
# Private DNS Zone Name = ${azurerm_private_dns_zone.dns-zone.name}
# Private DNS Zone ID = ${azurerm_private_dns_zone.dns-zone.id}
# Key Vault Name = ${azurerm_key_vault.kv.name}
# Key Vault ID = ${azurerm_key_vault.kv.id}
# VM IP = ${azurerm_public_ip.pip-vm.ip_address}
# ######################################################
# CUSTOM_OUTPUT  
# }
