module "network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1"

  project_id   = var.project_id
  network_name = var.network

  subnets = [
    {
      subnet_name   = var.subnetwork
      subnet_ip     = "10.0.0.0/17"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (var.subnetwork) = [
      {
        range_name    = "${var.cluster_name}-ip-range-a"
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = "${var.cluster_name}-ip-range-b"
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}

