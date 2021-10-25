resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = "projects/-/serviceAccounts/${var.sa_name}"
  role               = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${var.sa_name}"
  ]
}
