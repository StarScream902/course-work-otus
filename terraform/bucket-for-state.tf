terraform {
  # Версия terraform  
  required_version = ">=0.11,<0.12"
}

provider "google" {
  project     = "course-work-otus"
  region      = "us-east4"
  zone        = "us-east4-c"
}

resource "google_storage_bucket" "terraform-state" {
  name = "ff7rj49fj-terraform-state"
}
