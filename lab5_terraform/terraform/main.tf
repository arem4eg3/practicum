data "yandex_compute_image" "ubuntu-2204-latest" {
  family = "ubuntu-2204-lts"
}

module "tf-yc-instance" {
    source = "./modules/tf-yc-instance"  
    image_id = "${data.yandex_compute_image.ubuntu-2204-latest.id}"
    zone = var.zone
    subnet_id = module.tf-yc-network.output_subnet["default-${var.zone}"].id
} 

module "tf-yc-network" {
    source = "./modules/tf-yc-network"   
}