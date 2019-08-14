resource "google_compute_instance" "app" {
  name         = "${var.env}-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["app","ui","crawler"]

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
resource "google_compute_firewall" "firewall_ui" {
  name    = "allow-ui-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8000"]
  }

  target_tags = ["ui"]
}

resource "google_compute_firewall" "firewall_crawler" {
  name    = "allow-crawler-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8001"]
  }

  target_tags = ["crawler"]
}
