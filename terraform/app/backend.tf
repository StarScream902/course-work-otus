terraform {
  backend "gcs" {
    bucket  = "ff7rj49fj-terraform-state"
    prefix  = "prod"
  }
}
