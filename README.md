> This repository is part of Relay Monkey project.

## About
Terraform templates for provisioning instances in multiple cloud providers, covering majority of regions and zones with minimal configuration.

## Usage
**Important:** Edit `variables.demo.tf` file for this to work. Provision instances:
```shell
terraform init
terraform apply -parallelism=8
```
After the run is over, export to Jinja accessible directory. Jinja repository for converting output to Ansible inventory is available as part of my profile.
```shell
terraform output -json > ../jinja2/public_ips.json
```
Remove all resources:
```shell
terraform destroy -parallelism=8
```

## Supported clouds
* Alibaba Cloud
* Amazon Web Services (AWS)
* DigitalOcean
* Google Cloud Platform (GCP)
* Hetzner
* Linode
* Microsoft Azure

## Kudos / Proper respect
* DigitalOcean for ease of use.
* Hetzner for ease of use and fast Terraform run speed.
* Alibaba fast Terraform run speed when APIs are working as expected.
* GCP offers one view for all regions. Large benefit in comparison to AWS.

## Terraform Provider issues
* Alibaba SDK is sometimes slow and sometimes breaks, e.g. fetching available VM images.
* Alibaba needs your drivers licence or passport to register with their cloud.
* Google requests changing default CPU quota: `Error waiting for instance to create: Quota 'CPUS_ALL_REGIONS' exceeded.  Limit: 32.0 globally.`.
* Google API sometimes breaks while creating 60+ instances: `Error: Error loading zone 'europe-west4-b': Get https://www.googleapis.com/compute/v1/projects/global-latency/zones/europe-west4-b?alt=json&prettyPrint=false: dial tcp 172.217.19.106:443: connect: no route to host` or not enough resources `Error: Error waiting for instance to create: The zone 'projects/global-latency/zones/australia-southeast1-c' does not have enough resources available to fulfill the request.  Try a different zone, or try again later.`. As a result, only part of Terraform run is successful and it exits with error.
* Terraform needs to run twice to produce output after GCP provisioning fails with `Error waiting for instance to create: The zone 'projects/global-latency/zones/asia-south1-c' does not have enough resources available to fulfill the request.  Try a different zone, or try again later.`. Raise an issue on GitHub?
* Linode should start accepting multi-line access SSH keys.
* Azure is making difficult to deploy to all regions listed with `az account list-locations -o table`.
* Some Chinese regions are throttling `github.com` heavily.

## References
* AWS Terraform demo — https://github.com/kung-foo/multiregion-terraform
* https://serverfault.com/questions/833810/terraform-use-nested-loops-with-count/842346
* https://www.azurespeed.com/Information/AzureAvailabilityZones
* https://azurecomcdn.azureedge.net/cvt-1ae4b2f05a5fecdbde0942a3ad4ffa3db9b81f7bf1a8b3f7018a9839b48ea591/images/shared/regions-map-large.svg
* Terraform loops - https://serverfault.com/a/842346
* Combine `for_each` and `count` — https://www.reddit.com/r/Terraform/comments/ebohq8/how_to_create_azure_virtual_machines_in_all/
* Azure CLI list available resources — https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/error-sku-not-available#solution-2---azure-cli
* Azure products by region — https://azure.microsoft.com/en-us/global-infrastructure/services/?products=virtual-machines&regions=europe-north,europe-west
* Azure regions supporting availibility zones — https://docs.microsoft.com/en-us/azure/availability-zones/az-overview, https://www.azurespeed.com/Information/AzureAvailabilityZones
* GCP public IP — https://www.nebulaworks.com/blog/2019/04/22/simplify-your-gce-instance-bootstrapping-with-terraform/
* Powerful Terraform nested loop trick — https://stackoverflow.com/a/56066136
* Alibaba instance type by region — https://ecs-buy.aliyun.com/instanceTypes/?spm=a2c63.p38356.879954.7.1eeb2d44RauXg4#/instanceTypeByRegion
* Fortune 500 links — https://github.com/aleksandr-smechov/fortune500/blob/master/fortune500.csv
* Terraform `if` in `for_each` — https://www.terraform.io/docs/configuration/resources.html#for_each-multiple-resource-instances-defined-by-a-map-or-set-of-strings