variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию  
  default = "europe-west1"
}

variable public_key_path {
  # Описание переменной  
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone of instanse"
  default     = "europe-west1-d"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable public_key_path_appuser1 {
  description = "Path to the public key used for appuser1 ssh access"
}

variable public_key_path_appuser2 {
  description = "Path to the public key used for appuser2 ssh access"
}

variable public_key_path_appuser3 {
  description = "Path to the public key used for appuser3 ssh access"
}

variable count {
  description = "Number mashine"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-1554899674"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-1554899985"
}
