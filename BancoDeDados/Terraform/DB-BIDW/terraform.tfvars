# vsphere related params
vsphere_user = "terraform@vsphere.local"
vsphere_password = "P4r4n4.2022"
vsphere_server = "10.41.22.202"
vsphere_dc_name = "VIVO"
vsphere_dscluster = "VV_THIN_BIGDATA_PROD_01"
vsphere_compute_cluster = "VIVO_CL03_DB"
vsphere_portgroup_name = "VLAN_BDs"
vsphere_folder = "04_SQL"
vsphere_template_name = "23_TEMPLATE/TP_TERRAFORM_WIN_2016"
vsphere_virtual_machine = "TPRB21036 - SQL Integration Analysis Services - CDO" #Nome da VM no Iventário do vSphere

# Domain params
domain_admin_user = "terraform"
domain_admin_password = "P4r4n4.2022"
domain = "paranabanco.jm"
dns_domain = "paranabanco.jm"
dns1 = "10.41.20.2"
dns2 = "10.41.20.3"

# VM params
VM_IP = "10.41.21.36" #IP da VM
netmask = "24"
def_gw = "10.41.21.1"
winadmin_password = "P4r4n4.2022"
VM_name = "tprb21036" #DNS do Servidor no Dominio
vCPU = "24"
Memory = "8192"