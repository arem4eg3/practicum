**ReadMe.md**

### Module Dependencies:
- Terraform >= 0.12
- Yandex Provider >= 0.87.0

### Provider:
This module utilizes the Yandex provider for managing resources on the Yandex.Cloud platform.

### Available Parameters:
1. `network_zones`:
   - Description: Set of network zone names
   - Type: Set of strings
   - Default Value: ["default-ru-central1-a", "default-ru-central1-b", "default-ru-central1-d"]

### Outputs:
1. `output_subnet`:
   - Description: Subnet data for each specified network zone.

2. `output_network`:
   - Description: Network data for the specified network.

### Description:
This Terraform module fetches data about VPC (Virtual Private Cloud) network and subnet from Yandex.Cloud. It retrieves information about the default VPC network and the specified subnets in various network zones. The module outputs the fetched subnet data for each specified network zone and the network data for the default VPC network.