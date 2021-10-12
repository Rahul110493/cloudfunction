terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.82.0"
    }
  }
}
provider "google" {
  project = "${var.project_id}"
  region  = "${var.region}"
  zone = "${var.zone}"
}

module "cloudscheduler" {
    count = var.vendor == "cloudscheduler" ? 1 : 0
    source = "./gcp/service/cloudscheduler"

    scheduler_name = var.scheduler_name
    scheduler_cron = var.scheduler_cron
    scheduler_time_zone = var.scheduler_time_zone   
}

module "cloudscheduler_data" {
    count = var.vendor == "cloudscheduler_data" ? 1 : 0
    source = "./gcp/service/cloudscheduler_data"

    scheduler_name = var.scheduler_name
    scheduler_cron = var.scheduler_cron
    scheduler_time_zone = var.scheduler_time_zone  
    body = var.body
}
