output "monitoring_external-ip" {
  value = "${google_compute_instance.monitoring.network_interface.0.access_config.0.nat_ip}"
}
output "monitoring_internal-ip" {
  value = "${google_compute_instance.monitoring.network_interface.0.network_ip}"
}
