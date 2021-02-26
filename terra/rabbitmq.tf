resource "google_compute_instance" "default" {
  name         = "rabbitmq-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  network_interface {
    network    = "dress4win-vpc"
    subnetwork = "dress4win-vpc-subnet"
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "mysql-rabbitmq@group2-implementation.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  shielded_instance_config {
    enable_secure_boot = true
  }
}