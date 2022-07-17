# https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
# Manages a Resource Group.
resource "azurerm_resource_group" "k8s" {
  # (Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created.
  name     = var.resource_group_name
  # (Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created.
  location = var.location
}

# Manages a Managed Kubernetes Cluster (also known as AKS / Azure Kubernetes Service)
resource "azurerm_kubernetes_cluster" "k8s" {
  # (Required) The name of the Managed Kubernetes Cluster to create. 
  # Changing this forces a new resource to be created.
  name                = "${var.cluster_name}"
  # (Required) The location where the Managed Kubernetes Cluster should be created.
  # Changing this forces a new resource to be created.
  location            = azurerm_resource_group.k8s.location
  # (Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. 
  # Changing this forces a new resource to be created.
  resource_group_name = azurerm_resource_group.k8s.name
  # (Required) DNS prefix specified when creating the managed cluster. 
  # Changing this forces a new resource to be created.
  dns_prefix          = var.dns_prefix
  # If the cluster has the Kubernetes API only exposed on internal IP addresses.
  private_cluster_enabled = true
  # (Optional) Version of Kubernetes specified when creating the AKS managed cluster. 
  # If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade).
  kubernetes_version   = "1.21.9"

  # (Required) A default_node_pool block as defined below.
  default_node_pool {
    # (Required) The name which should be used for the default Kubernetes Node Pool. 
    # Changing this forces a new resource to be created.
    name            = var.agent_pool_name
    # (Optional) The initial number of nodes which should exist in this Node Pool. 
    # If specified this must be between 1 and 100 and between min_count and max_count.
    node_count      = var.agent_count
    # (Required) The size of the Virtual Machine, such as Standard_DS2_v2.
    # System node pool must use VM sku with more than 2 cores and 4GB memory.
    vm_size         = var.vm_size
    # vm_size         = "Standard_D8s_v3" # For Pega
    # (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. 
    # Changing this forces a new resource to be created.
    vnet_subnet_id  = var.subnet_id
  }

  # (Optional) A role_based_access_control block. 
  # Changing this forces a new resource to be created.
  #role_based_access_control {
  #  enabled = true
  #}

  # (Optional) A service_principal block as documented below.
  service_principal {
    # (Required) The Client ID for the Service Principal.
    client_id     = var.client_id
    # (Required) The Client Secret for the Service Principal.
    client_secret = var.client_secret
  }

  # (Optional) A network_profile block as defined below.
  network_profile {
    # (Required) Network plugin to use for networking. 
    # Currently supported values are azure and kubenet. Changing this forces a new resource to be created
    network_plugin     = "kubenet" # if set as azure all the pods will get the ip address from the subnet_id
    # (Optional) The CIDR to use for pod IP addresses.
    # This field can only be set when network_plugin is set to kubenet
    # Changing this forces a new resource to be created.
    pod_cidr           = "10.244.0.0/16"
    # (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. 
    # Currently supported values are calico and azure. Changing this forces a new resource to be created.
    # network_policy     = "azure"
    # (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). 
    # Changing this forces a new resource to be created.
    dns_service_ip     = "10.129.0.10"
    # (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. 
    # Changing this forces a new resource to be created.
    docker_bridge_cidr = "172.17.0.1/16"
    # (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created.
    service_cidr       = "10.129.0.0/16"
  }

  # (Optional) A addon_profile block as defined below.
  addon_profile {
    #  (Optional) A oms_agent block as defined below. For more details, please visit How to onboard Azure Monitor for containers.
    # A http_application_routing block as defined below.
    # (Optional) A kube_dashboard block as defined below.
    kube_dashboard {
      # (Required) Is the Kubernetes Dashboard enabled?
      enabled = false
    }
  }

  # (Optional) A mapping of tags to assign to the resource.
  tags = {
    Environment = var.environment
  }
}