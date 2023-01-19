resource "proxmox_vm_qemu" "srv_demo_1" {
  name = "srv-demo-1"
  desc = "Ubuntu Server"
  vmid = "401"
  target_node = "pve1"

  agent =  1

  clone = "ubuntu-2210-template"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = "2048"

  vga {
    type = "serial0"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
    firewall = true
  }

  disk {
    type = "scsi"
    storage = "vm_storage"
    size = "32G"
  }

  os_type = "cloud-init"
  ipconfig0 = "ip=192.168.1.15/24,gw=192.168.1.1"
  ciuser = "brandon"
  sshkeys = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTtDbc3XtUJAnQ6sTghx1riBaE4QkTiX6EYR/1TjSvBJAETB3CDm53GysqCKDfDbLF5H31omXqnidM/D/7DbCJlIU2RqqNaz1RKOtdoEp9uVgZyJss6Pd5PYFvoQURucWDfzh5O7KTkd++SD7h4x5BP3H1VWqFPGoBps26zfc8Tgstbq+iFAl6TB54FtNA9X90wyX+zap4iiN17RKKKVnpQEVGlOV/OjNw/WhX2y5jRqHFMnDkrK7IM0f/Syedn6xYWc5YdWIFyvHniCjtNitEt/ByKkuzzmUllFXtY9Z+bd1W/maTmHrmLw2AknEKOPzYuF6m5xXjy8RSmnqZ8PZv brand@RAMPAGE
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF4RRDfE/gpcHCYVfaoNC2ZaNR75PxGjYioQFbooAJ9vlWWXau5om8DTX6lFv0xjtw4aqiQaMThNXX8uHb/ykokQ4Rd304GvSYOoRNeLyLS0SReDOO44f7W1oLr2to+SlB88bhrFsqMEPgu1fbH2W0pebFzSiYudqJQwnC5Vc9rmbmKHcsYqFoO5mAMlyc69bqwLHt2kM2VFNK/CM+DSmETeUmQkXTauOPOHNY/FSmWEZMRAc5gkcGbulTeNx8yl7ZQkligBw1M7mda2jzfoCczlKKVXMzaqoTMh6VyfrC4eXXwNsgcZZcyTwrq6C/w1T1G+8glPOygiIA8Obm1mUD brand@LAPTOP-H1LRSAR9
  EOF
}