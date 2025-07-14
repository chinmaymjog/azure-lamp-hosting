# ## Common variables for project webhost
project  = "webhost"
p_short  = "host"
location = "centralindia"
l_short  = "inc"
vm_user  = "azureuser"
ip_allow = ["152.58.32.249"]

# ## Environment variables for hub
hub_vnet_space        = ["10.0.0.0/24"]
hub_snet_web          = ["10.0.0.0/26"]
bastion_size          = "Standard_B2s"
bastion_osdisk        = 64
bastion_datadisk      = 64
netapp_sku            = "Standard"
netapp_pool_size_intb = 1

# ## Environment variables for web environments
webvm_size     = "Standard_B2s"
webvm_count    = "2"
webvm_osdisk   = 64
webvm_datadisk = 64
dbsku          = "GP_Standard_D2ads_v5"
dbsize         = 20

netapp_volume_sku = "Standard"

storage_quota_in_gb = 100

# ## Environment variables for preproduction
preprod_vnet_space  = ["10.0.2.0/24"]
preprod_snet_web    = ["10.0.2.0/26"]
preprod_snet_db     = ["10.0.2.64/26"]
preprod_snet_netapp = ["10.0.2.128/26"]

## Environment variables for production
prod_vnet_space  = ["10.0.1.0/24"]
prod_snet_web    = ["10.0.1.0/26"]
prod_snet_db     = ["10.0.1.64/26"]
prod_snet_netapp = ["10.0.1.128/26"]

