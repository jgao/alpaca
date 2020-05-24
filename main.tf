provider "google" {
  project = "catan-278222"
  region  = "us-west1"
  zone    = "us-west1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "catan-instance"
  machine_type = "f1-micro"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }

  service_account {
    email = "terraform@catan-278222.iam.gserviceaccount.com"
    scopes = ["storage-full"]
  }

  metadata_startup_script = <<SCRIPT
echo 'starting startup'
git clone https://github.com/jgao/alpaca.git
cd alpaca

gsutil cp gs://catan-secrets/* .

sudo apt update
sudo apt -y install python3-pip

sudo  pip3 install alpaca_trade_api

echo 'finished startup'
SCRIPT

}

resource "google_storage_bucket" "secrets" {
  name          = "catan-secrets"
  location      = "US"
}
