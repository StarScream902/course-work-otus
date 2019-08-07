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

resource "google_compute_instance" "gitlab" {
  name         = "gitlab"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags         = ["gitlab"]

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "r2d2:${file(var.public_key_path)}"
  }

	connection {
    type  = "ssh"
	  user  = "${var.ssh_user}"
	  agent = false
	  private_key = "${file(var.private_key_path)}"
	}
}

# Правило firewall
resource "google_compute_firewall" "firewall_gitlab" {
  name    = "allow-gitlab-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443","80"]
  }

  target_tags = ["gitlab"]
}
