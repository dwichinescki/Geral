# Environment
variable environment {
  default = "Homolog"
}

# Creator
variable creator {
  default = "Daniel Wichinescki"
}

# CostCenter
variable costcenter {
  default = "CoE Infra-Cloud Sustentacao"
}

# CreationSource
variable creationsource {
  default = "Terraform"
}

# SPN ID
variable "client_id" {
  default = "4baf689f-c87f-4c85-bc28-9c4f3a9cc80b"
}

# SPN Password
variable "client_secret" {
  default = "kSW8Q~ho5NT9S1zBoOcRAGDy4wQ_KMXSchLNzcDD"
}

# TENANT ID
variable "tenant_id" {
  default = "502fe815-28ec-4a53-95a9-13bc724e318b"
}

# SUBSCRIPTION ID
variable "subscription_id" {
  default = "19d24e10-1ddf-4f7e-9615-abd8dc3b88d3"
}

# Amount of agents (Nodes)
variable "agent_count" {
    default = 2
}

# Agent pool Name
variable agent_pool_name {
  default = "agentpool"
}

# VM Size
# Minimum: Standard_D2_v2
variable vm_size {
  # default = "Standard_D8s_v3"
  default = "Standard_B2s"
}

# Linux User
variable admin_username {
  default = "jmadmin"
}

## SSH Key
#variable "ssh_public_key" {
#    default = "~/.ssh/jm004.pem.pub"
#}

# Set the Virtual Network/Subnet that will be store the VMSS
variable "subnet_id" {
  default     = "/subscriptions/19d24e10-1ddf-4f7e-9615-abd8dc3b88d3/resourceGroups/PRB_Network/providers/Microsoft.Network/virtualNetworks/Azure_RedeVirtual/subnets/prb-hml-aks-pv"
}
# DNS Prefix
variable "dns_prefix" {
    default = "homolog-aks-terraform"
}

# Cluster Name
variable cluster_name {
    default = "homolog-aks-terraform"
}

# Resource Group Name
variable resource_group_name {
    default = "homolog-aks-terraform"
}

# Location
variable location {
    default = "brazilsouth"
}