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

module "gcp-cloudfunctions" {
  source = "./gcp/service/cloudfunctions"
        
  function_name         = var.function_name    
  description           = var.description != "" ? var.description : "${var.name} HTTP Cloud Function"
  available_memory_mb   = var.available_memory_mb
  bucket_name           = var.bucket_name
  timeout               = var.timeout
  entry_point           = var.entry_point
  runtime               = var.runtime
  environment_variables = var.environment_variables
  service_account_email = var.service_account_email
  vpc_connector         = var.vpc_connector
  max_instances         = var.max_instances
  depends_on = [module.cloudscheduler]
}
