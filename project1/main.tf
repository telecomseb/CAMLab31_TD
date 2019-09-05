#####################################################################
##
##      Created 9/5/19 by admin. for project1
##
#####################################################################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "maVM_template" {
  name          = "${var.maVM_template_name}"
  datacenter_id = "${data.vsphere_datacenter.maVM_datacenter.id}"
}

data "vsphere_datacenter" "maVM_datacenter" {
  name = "${var.maVM_datacenter_name}"
}

data "vsphere_datastore" "maVM_datastore" {
  name          = "${var.maVM_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.maVM_datacenter.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_network_name}"
  datacenter_id = "${data.vsphere_datacenter.maVM_datacenter.id}"
}

resource "vsphere_virtual_machine" "maVM" {
  name          = "${var.maVM_name}"
  datastore_id  = "${data.vsphere_datastore.maVM_datastore.id}"
  num_cpus      = "${var.maVM_number_of_vcpu}"
  memory        = "${var.maVM_memory}"
  guest_id = "${data.vsphere_virtual_machine.maVM_template.guest_id}"
  resource_pool_id = "${var.maVM_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.maVM_template.id}"
  }
  disk {
    name = "${var.maVM_disk_name}"
    size = "${var.maVM_disk_size}"
  }
}