module "gcp-cloudfunctions" {
  source = "./gcp/service/cloudfunctions"
}
  
resource "google_cloud_scheduler_job" "cloudscheduler" {
  name         = var.scheduler_name
  description  = "cloudscheduler"
  schedule     = var.scheduler_cron
  time_zone    = var.scheduler_time_zone
  
  http_target {
    http_method = "GET"
    uri = uri
  }
}
