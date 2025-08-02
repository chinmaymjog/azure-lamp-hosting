output "web_details" {
  value = <<CUSTOM_OUTPUT

Hub Resource Group Name = ${module.hub.hub_rg_name}
Front Door Name = ${module.hub.fd_name}
Netapp Account Name = ${module.hub.netapp_account_name}
Netapp Pool Name = ${module.hub.netapp_pool_name}
DNS Zone Name = ${module.hub.dns_zone_name}
Key Vault Name = ${module.hub.key_vault_name}
Container Registry Login Server = ${module.hub.container_registry_login_server}
Container Registry Admin Username = ${module.hub.container_registry_admin_username}

Bastion VM Public IP = ${module.hub.vm_ip}
Bastion VM Private IP = ${module.hub.vm_private_ip}

Production Resource Group Name = ${module.prod-web.resource_group_name}
Production MySQL server Name = ${module.prod-web.mysql_name}
Production Load Balancer IP = ${module.prod-web.lb_ip}
  Production Web Server Private IPs
  ${module.prod-web.web_vms[0]} = ${module.prod-web.web_vms_private_ips[0]}
  ${module.prod-web.web_vms[1]} = ${module.prod-web.web_vms_private_ips[1]}

PreProduction Resource Group Name = ${module.preprod-web.resource_group_name}
PreProduction MySQL server Name = ${module.preprod-web.mysql_name}
PreProduction Load Balancer IP = ${module.preprod-web.lb_ip}
  PreProduction Web Server Private IPs
  ${module.preprod-web.web_vms[0]} = ${module.preprod-web.web_vms_private_ips[0]}
  ${module.preprod-web.web_vms[1]} = ${module.preprod-web.web_vms_private_ips[1]}

CUSTOM_OUTPUT  
}

resource "local_file" "hosts" {
  content  = <<EOF
[production]
${module.prod-web.web_vms[0]} ansible_host=${module.prod-web.web_vms_private_ips[0]}
${module.prod-web.web_vms[1]} ansible_host=${module.prod-web.web_vms_private_ips[1]}

[preproduction]
${module.preprod-web.web_vms[0]} ansible_host=${module.preprod-web.web_vms_private_ips[0]}
${module.preprod-web.web_vms[1]} ansible_host=${module.preprod-web.web_vms_private_ips[1]}  

EOF
  filename = "${path.module}/hosts"
}
