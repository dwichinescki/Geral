# vsphere related params
vsphere_user = "terraform@vsphere.local"
vsphere_password = "P4r4n4.2022"
vsphere_server = "10.41.22.202"
vsphere_dc_name = "VIVO"
vsphere_dscluster = "VV_DECO_HOMOLOG_034"
vsphere_compute_cluster = "VIVO_CL05_DTH"
vsphere_portgroup_name = "VM_HOMOLOG_V10"
vsphere_folder = "25_Terraform"
vsphere_template_name = "23_TEMPLATE/TP_TERRAFORM_WIN_2019"
vsphere_virtual_machine = "TPRB10233 - DB TERRAFORM" #Nome da VM no Iventário do vSphere

# Domain params
domain_admin_user = "terraform"
domain_admin_password = "P4r4n4.2022"
domain = "prbhomolog.local"
dns_domain = "prbhomolog.local"
dns1 = "10.140.10.200"
dns2 = "10.140.10.201"

# VM params
VM_IP = "10.140.10.233" #IP da VM
netmask = "24"
def_gw = "10.140.10.1"
winadmin_password = "P4r4n4.2022"
VM_name = "tprb10233" #DNS do Servidor no Dominio
vCPU = "4"
Memory = "8192"