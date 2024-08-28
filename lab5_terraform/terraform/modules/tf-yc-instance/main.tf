resource "yandex_compute_instance" "vm-1" {
    name        = "terraform-std-028-38"
    zone        = var.zone
    platform_id = var.platform_id 
    scheduling_policy {
      preemptible = var.preemptible
    }

    resources {
        cores  = var.cores
        memory = var.memory
    }

   boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.size
    }
  }

    network_interface {
        subnet_id = var.subnet_id
        nat       = var.nat
    }

   metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
        user-data = file("${path.module}/user_data.yaml")
    }    
}