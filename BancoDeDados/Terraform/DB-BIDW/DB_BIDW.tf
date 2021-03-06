provider "vsphere" {
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  vsphere_server       = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_dc_name}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_dscluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_compute_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_portgroup_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "Clone" {
  name             = "${var.vsphere_virtual_machine}"
  folder           = "${var.vsphere_folder}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.vCPU}"
  memory   = "${var.Memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_controller_count = 2
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "${var.VM_name}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub = true
    thin_provisioned = false
  }

  disk { 
    label = "${var.VM_name}1.vmdk"
    unit_number = 15
    size = 30
    eagerly_scrub = true
    thin_provisioned = false
  }

  disk { 
    label = "${var.VM_name}2.vmdk"
    unit_number = 16
    size = 100
    eagerly_scrub = true
    thin_provisioned = false
  }

  disk { 
    label = "${var.VM_name}3.vmdk"
    unit_number = 17
    size = 100
    eagerly_scrub = true
    thin_provisioned = false
  }

    disk { 
    label = "${var.VM_name}4.vmdk"
    unit_number = 18
    size = 100
    eagerly_scrub = true
    thin_provisioned = false
  }

    disk { 
    label = "${var.VM_name}5.vmdk"
    unit_number = 19
    size = 100
    eagerly_scrub = true
    thin_provisioned = false
  }

    disk { 
    label = "${var.VM_name}6.vmdk"
    unit_number = 20
    size = 100
    eagerly_scrub = true
    thin_provisioned = false
  }
  
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    customize {
      windows_options {
        computer_name          = "${var.VM_name}"
        join_domain            = "${var.domain}"
        domain_admin_user      = "${var.domain_admin_user}"
        domain_admin_password  = "${var.domain_admin_password}"
        auto_logon             = true
        auto_logon_count       = 1
        admin_password         = "${var.winadmin_password}"
      }

      network_interface {
        ipv4_address    = "${var.VM_IP}"
        ipv4_netmask    = "${var.netmask}"
        dns_server_list = ["${var.dns1}", "${var.dns2}"]
        dns_domain      = "${var.dns_domain}"
      }
      ipv4_gateway = "${var.def_gw}"
    }
  }
}