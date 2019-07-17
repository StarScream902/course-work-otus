resource "google_compute_firewall" "firewall_node-exporter" {
  name    = "default-allow-node-exporter"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9100"]
  }

  source_ranges = "${var.source_ranges}"
}
