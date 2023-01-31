output "ubuntu_2204_names" {
  description = "Name/Hostname Assigned to resource"
  value = proxmox_vm_qemu.ubuntu-2204.*.name
}

output "ubuntu_2204_ip_address" {
  description = "IP Address for resource provisioned"
  value = proxmox_vm_qemu.ubuntu-2204.*.default_ipv4_address
}

output "k3s_cluster_names" {
  description = "Name/Hostname Assigned to resource"
  value = proxmox_vm_qemu.k3s_cluster.*.name
}

output "k3s_cluster_ip_address" {
  description = "IP Address for resource provisioned"
  # value = proxmox_vm_qemu.k3s_cluster.*.ipconfig0
  value = proxmox_vm_qemu.k3s_cluster.*.default_ipv4_address
}
