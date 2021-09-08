variable "deployment" {}
variable "project_id" {}

provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "default" {
  name    = "address-${var.deployment}"
  network = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/default"
  source_ranges = ["0.0.0.0/0"]
  deny {
    protocol = "tcp"
    ports    = ["11234", "16180"]
  }
}
