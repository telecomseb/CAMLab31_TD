#####################################################################
##
##      Created 9/5/19 by admin. for project1
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "maVM_name" {
  type = "string"
  description = "Virtual machine name for maVM"
}

variable "maVM_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "maVM_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "maVM_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "maVM_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "maVM_template_name" {
  type = "string"
  description = "Generated"
}

variable "maVM_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "maVM_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "maVM_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "network_network_name" {
  type = "string"
  description = "Generated"
}

