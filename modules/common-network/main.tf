# Development - VPC and Subnets
module "vpc-host-dev" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.vpc_host_dev_project_id
  network_name = "vpc-host-dev"
  routing_mode = "GLOBAL"

  subnets = [

    {
      subnet_name           = "subnet-dev-1"
      subnet_ip             = "10.26.3.0/24"
      subnet_region         = "asia-southeast1"
      subnet_private_access = true
    },
    {
      subnet_name           = "subnet-dev-2"
      subnet_ip             = "10.26.4.0/24"
      subnet_region         = "asia-southeast2"
      subnet_private_access = true
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-dev-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-dev-allow-icmp" {
  name      = "vpc-host-dev-allow-icmp"
  network   = module.vpc-host-dev.network_name
  project   = var.vpc_host_dev_project_id
  direction = "INGRESS"
  priority  = 10000

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

# Non-Prod - VPC and Subnets
module "vpc-host-nonprod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.vpc_host_nonprod_project_id
  network_name = "vpc-host-nonprod"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "subnet-non-prod-1"
      subnet_ip             = "10.26.1.0/24"
      subnet_region         = "asia-southeast1"
      subnet_private_access = true
    },
    {
      subnet_name           = "subnet-non-prod-2"
      subnet_ip             = "10.26.2.0/24"
      subnet_region         = "asia-southeast2"
      subnet_private_access = true
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-nonprod-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-nonprod-allow-icmp" {
  name      = "vpc-host-nonprod-allow-icmp"
  network   = module.vpc-host-nonprod.network_name
  project   = var.vpc_host_nonprod_project_id
  direction = "INGRESS"
  priority  = 10000

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}


# Production - VPC and Subnets
module "vpc-host-prod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.vpc_host_prod_project_id
  network_name = "vpc-host-prod"
  routing_mode = "GLOBAL"

  subnets = [

    {
      subnet_name           = "subnet-prod-1"
      subnet_ip             = "10.0.0.0/10"
      subnet_region         = "asia-southeast1"
      subnet_private_access = true
    },
    {
      subnet_name           = "subnet-prod-2"
      subnet_ip             = "10.64.0.0/10"
      subnet_region         = "asia-southeast2"
      subnet_private_access = true
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-prod-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-prod-allow-icmp" {
  name      = "vpc-host-prod-allow-icmp"
  network   = module.vpc-host-prod.network_name
  project   = var.vpc_host_prod_project_id
  direction = "INGRESS"
  priority  = 10000

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}
