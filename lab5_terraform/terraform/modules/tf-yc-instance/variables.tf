
variable "image_id" {
  description = "Image ID"
  type        = string
  default = "fd8oom38rdtlp4qrv61l"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default = "e9b02b351gs65kk34mfr"
}

variable "zone" {
  description = "Zone"
  type    = string
  default = "ru-central1-a"
}

variable "platform_id" {
  description = "Platform ID"
  type    = string
  default = "standard-v3"
}

variable "cores" {
  description = "Number of cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory size GB"
  type        = number
  default     = 2
}

variable "size" {
  description = "Hard Disk VM size GB"
  type        = number
  default     = 50
}

variable "nat" {
  description = "Turn On external IP"
  type        = bool
  default     = true
}

variable "preemptible" {
  type        = bool
  default     = true
}

