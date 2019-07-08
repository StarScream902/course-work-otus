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

module "ui" {
  source = "../modules/ui"

  public_key_path = "${var.public_key_path}"

  zone = "${var.zone}"

  app_disk_image = "${var.app_disk_image}"
}

module "crawler" {
  source        = "../modules/crawler"
  
  public_key_path = "${var.public_key_path}"

  zone = "${var.zone}"

  app_disk_image = "${var.app_disk_image}"

}
