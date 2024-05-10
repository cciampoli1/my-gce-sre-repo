provider "google" {
  credentials = file("YOUR-CREDENTIALS-FILE.json")
  project     = "YOUR-PROJECT-ID"
  region      = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}
