provider "google" {
  credentials = file("YOUR-CREDENTIALS-FILE.json")
  project     = "YOUR-PROJECT-ID"
  region      = "us-central1"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "terraform-gke-cluster"
  location = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_pool" {
  name       = "primary-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}
