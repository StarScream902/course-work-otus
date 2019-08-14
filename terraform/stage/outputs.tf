output "db_external_ip" {
  value = "${module.db.db_external-ip}"
}

output "db_internal_ip" {
  value = "${module.db.db_internal-ip}"
}

output "monitoring_external-ip" {
  value = "${module.monitoring.monitoring_external-ip}"
}
output "monitoring_internal-ip" {
  value = "${module.monitoring.monitoring_internal-ip}"
}

output "app_external_ip" {
  value = "${module.app.app_external-ip}"
}

output "app_internal_ip" {
  value = "${module.app.app_internal-ip}"
}
