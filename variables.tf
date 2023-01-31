variable "proxmox_api_url" {
  description = "Proxmox API URL for Proxmox Server"
  type        = string
}

variable "proxmox_api_token_id" {
  description = "Proxmox API ID to use"
  type        = string
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  description = "Proxmox API Token to use"
  type        = string
  sensitive   = true
}
