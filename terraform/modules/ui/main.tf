resource "google_compute_instance" "ui" {
  name = "ui"

  machine_type = "g1-small"

  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  metadata {
    ssh-keys = "r2d2:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "app_ip" {
  name = "course-work-otus-app-ip"
}

resource "google_compute_firewall" "http" {
  name    = "default-firewall-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = "${var.app_firewall_source_ip}"
}
