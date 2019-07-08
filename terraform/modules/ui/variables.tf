variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"

  default = "reddit-app-base"
}

variable "app_firewall_source_ip" {
  description = "Allow source ip address"
  default     = ["0.0.0.0/0"]
}
