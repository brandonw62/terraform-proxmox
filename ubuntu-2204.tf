resource "proxmox_vm_qemu" "ubuntu-2204" {
  count       = 1
  name        = "ubuntu-2204-0${count.index + 1}"
  desc        = "Ubuntu Server"
  vmid        = "40${count.index + 1}"
  target_node = "pve1"

  agent = 1

  clone   = "ubuntu-2204-template"
  cores   = 2
  sockets = 1
  cpu     = "host"
  memory  = "2048"

  scsihw      = "virtio-scsi-single"
  # boot = "ide2,scsi0,net0,ide0"

  vga {
    type = "serial0"
  }

  network {
    model    = "virtio"
    bridge   = "vmbr1"
    firewall = true
  }

  disk {
    type    = "scsi"
    storage = "vm_storage"
    size    = "32G"
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=192.168.1.15/24,gw=192.168.1.1"
  # ciuser = ""
  # sshkeys = <<EOF
  # EOF
}
