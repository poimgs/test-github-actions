provider "google" {
  project = "learn-terraform-337209"
  region  = "asia-southeast1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220118"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}
