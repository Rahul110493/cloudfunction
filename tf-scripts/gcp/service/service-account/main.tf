resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = var.sa_name
  role               = "roles/iam.serviceAccountUser"

  members = [
    var.sa_name
  ]
}
