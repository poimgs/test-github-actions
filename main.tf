provider "google" {
  credentials = file("learn-terraform-337209-bb651da8f4c0.json")
  project     = "learn-terraform-337209"
  region      = "asia-southeast1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  metadata = {
    ssh-keys = "poimgs:${file("~/.ssh/id_ed25519.pub")}"
  }

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
