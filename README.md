# Terraform-Proxmox

## Overview

Automate the provisioning of virtual machines in proxmox using terraform

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
