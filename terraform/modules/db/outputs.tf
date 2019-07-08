output "db_external-ip" {
  value = "${google_compute_instance.db.network_interface.0.access_config.0.nat_ip}"
}

output "db_internal-ip" {
  value = "${google_compute_instance.db.network_interface.0.network_ip}"
}
