variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default = "us-east4"
}

variable zone {
  description = "zone"
  default = "us-east4-c"
}

variable docker_disk_image {
  description = "Disk image"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable "ssh_user" {
  description = "ssh user"
  default     = "r2d2"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}
