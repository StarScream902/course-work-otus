output "gitlab_internal-ip" {
  value = "${google_compute_instance.gitlab.network_interface.0.access_config.0.nat_ip}"
}

output "gitlab_external-ip" {
  value = "${google_compute_instance.gitlab.network_interface.0.network_ip}"
}
