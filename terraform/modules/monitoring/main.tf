resource "google_compute_instance" "monitoring" {
  name         = "monitoring"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["monitoring","prometheus","grafana"]

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
resource "google_compute_firewall" "firewall_prometheus" {
  name    = "allow-prometheus-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  target_tags = ["prometheus"]
}

resource "google_compute_firewall" "firewall_grafana" {
  name    = "allow-grafana-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  target_tags = ["grafana"]
}
