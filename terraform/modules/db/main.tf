resource "google_compute_instance" "db" {
  name         = "db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["db","mongodb","rabbitmq"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
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
resource "google_compute_firewall" "firewall_mongodb" {
  name    = "allow-mongodb-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags = ["mongodb"]
}

resource "google_compute_firewall" "firewall_rabbitmq" {
  name    = "allow-rabbitmq-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["rabbitmq"]
  }

  target_tags = ["rabbitmq"]
}
