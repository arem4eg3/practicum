output "output_subnet" {
    value = data.yandex_vpc_subnet.vpc_subnet
}

output "output_network" {
    value = data.yandex_vpc_network.vpc_network
}