output "ip_address_internal" {
   value = module.tf-yc-instance.ip_address_internal
} 

output "ip_address_external" {
    value = module.tf-yc-instance.ip_address_external
}