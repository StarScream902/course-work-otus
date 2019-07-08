output "db_external_ip" {
  value = "${module.db.db_external-ip}"
}

output "db_internal_ip" {
  value = "${module.db.db_internal-ip}"
}
