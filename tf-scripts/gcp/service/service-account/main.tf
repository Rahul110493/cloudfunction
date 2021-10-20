resource "google_service_account" "sa" {
  account_id   = var.sa_name
  display_name = "Service account for retention"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    var.pipeline_sa
  ]
}
