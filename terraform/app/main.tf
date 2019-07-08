terraform {
  # Версия terraform  
  required_version = ">=0.11,<0.12"
}

provider "google" {
  # Версия провайдера  
  version = "2.0.0"

  # ID проекта  
  project = "${var.project}"

  region = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "course-work-otus"
  machine_type = "g1-small"
  zone         = "europe-west1-b"

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "app-base"
    }
  }

  metadata {
    ssh-keys = "r2d2:${file("~/.ssh/r2d2.pub")}"
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }

  connection {
    type        = "ssh"
    user        = "r2d2"
    agent       = false
    private_key = "${file("~/.ssh/r2d2")}"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}


