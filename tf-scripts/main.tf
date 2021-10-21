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

module "enable-api" {
  source= "./gcp/service/api-resources"
  gcp_service_list=var.gcp_service_list
}

  module "service-account" {
  source= "./gcp/service/service-account"
  sa_name = var.sa_name
  pipeline_sa = var.pipeline_sa
  depends_on = [module.enable-api]
}
  
module "cloudscheduler" {
    source = "./gcp/service/cloudscheduler"

    scheduler_name = var.scheduler_name
    scheduler_cron = var.scheduler_cron
    scheduler_time_zone = var.scheduler_time_zone
    service_account_email = module.service-account.serviceaccount
    url = module.gcp-cloudfunctions.url
    api_path = var.api_path
    depends_on = [module.gcp-cloudfunctions]
}

module "gcp-cloudfunctions" {
  source = "./gcp/service/cloudfunctions"
        
  function_name         = var.function_name    
  description           = var.description != "" ? var.description : "${var.function_name} HTTP Cloud Function"
  available_memory_mb   = var.available_memory_mb
  bucket_name           = var.bucket_name
  timeout               = var.timeout
  entry_point           = var.entry_point
  runtime               = var.runtime
  environment_variables = var.environment_variables
  service_account_email = module.service-account.serviceaccount
  vpc_connector         = var.vpc_connector
  max_instances         = var.max_instances
  depends_on = [module.enable-api,module.service-account]
  
}
