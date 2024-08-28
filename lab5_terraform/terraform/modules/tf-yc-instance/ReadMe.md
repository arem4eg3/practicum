**ReadMe.md**

### Module Dependencies:
- Terraform >= 0.12
- Yandex Provider >= 0.87.0

### Provider:
This module utilizes the Yandex provider for managing resources on the Yandex.Cloud platform.

### Available Parameters:
1. `image_id`:
   - Description: Image ID
   - Type: String
   - Default Value: "fd8oom38rdtlp4qrv61l"

2. `subnet_id`:
   - Description: Subnet ID
   - Type: String
   - Default Value: "e9b02b351gs65kk34mfr"

3. `zone`:
   - Description: Zone
   - Type: String
   - Default Value: "ru-central1-a"

4. `platform_id`:
   - Description: Platform ID
   - Type: String
   - Default Value: "standard-v3"

5. `cores`:
   - Description: Number of cores
   - Type: Number
   - Default Value: 2

6. `memory`:
   - Description: Memory size (GB)
   - Type: Number
   - Default Value: 2

7. `size`:
   - Description: Hard Disk size (GB)
   - Type: Number
   - Default Value: 50

8. `nat`:
   - Description: Turn On external IP
   - Type: Boolean
   - Default Value: true

9. `preemptible`:
   - Description: Use preemptible instances
   - Type: Boolean
   - Default Value: true

### Outputs:
1. `ip_address_internal`:
   - Description: Internal IP address of the created instance.

2. `ip_address_external`:
   - Description: External IP address (NAT IP) of the created instance.

### Description:
This Terraform module provisions a Yandex Compute Engine instance with the specified configuration parameters, including image, zone, platform, networking, and resource specifications. It also generates SSH keys for user authentication and configures user access via cloud-init. The module outputs the internal and external IP addresses of the created instance.