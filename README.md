# Terraform-Proxmox

## Overview

Automate the provisioning of virtual machines in proxmox using terraform

## Prerequisites

1. Proxmox Server

## Resources

1. [Ubunutu Cloud Images](https://cloud-images.ubuntu.com/)
2. [Debian Cloud Images](https://cloud.debian.org/images/cloud/)
3. [Terraform Proxmox Provider](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)

### Install libguestfs-tools
```bash
ssh root@proxmox-server

sudo apt update -y && sudo apt install libguestfs-tools -y
```

### Download Ubuntu Cloud Image
```bash
wget https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img

# Change file extension of the image to .qcow2
mv ubuntu-22.04-minimal-cloudimg-amd64.img ubuntu-22.04.qcow2
```

### Download Debian Cloud Image
```bash
wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-arm64.qcow2
```

### Install qemu-guest-agent in the cloud image
```bash
virt-customize -a ubuntu-22.04.qcow2 --install qemu-guest-agent
qemu-img resize ubuntu-22.04.qcow2 32G
# or
virt-customize -a debian-11-generic-amd64.qcow2 --install qemu-guest-agent
qemu-img resize debian-11-generic-amd64.qcow2 32G
```

### Create VM Template
```bash
qm create 900 --name "debian-11-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr1
qm importdisk 900 debian-11-generic-amd64.qcow2 local-lvm
qm set 900 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-900-disk-0
qm set 900 --boot c --bootdisk scsi0
qm set 900 --ide2 local-lvm:cloudinit
qm set 900 --serial0 socket --vga serial0
qm set 900 --agent enabled=1

qm template 900
```

## Getting Started

- Create a local copy of `credentials.example`:

```bash
cp credentials.example credentials.auto.tfvars
```

- Create an API token in proxmox and populate the necessary values in `credentials.auto.tfvars`

```bash
# Initialize the provider
terraform init

# Shows us what terraform plans on creating
terraform plan

# Deploy Resources
terraform apply -auto-approve

# Destroy Resoureces
terraform destroy
```
