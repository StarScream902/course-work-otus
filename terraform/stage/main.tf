terraform {
  # Версия terraform  
  required_version = ">=0.11,<0.12"
}

provider "google" {
  # Версия провайдера  
  version = "2.0.0"

  # ID проекта  
  project = "${var.project}"
  region = "${var.region}"
}

module "db" {
  source            = "../modules/db"
  public_key_path   = "${var.public_key_path}"
  zone              = "${var.zone}"
  db_disk_image     = "${var.db_disk_image}"
  ssh_user          = "${var.ssh_user}"
  private_key_path  = "${var.private_key_path}"
}

module "monitoring" {
  source            = "../modules/monitoring"
  public_key_path   = "${var.public_key_path}"
  zone              = "${var.zone}"
  docker_disk_image = "${var.docker_disk_image}"
  ssh_user          = "${var.ssh_user}"
  private_key_path  = "${var.private_key_path}"
}
