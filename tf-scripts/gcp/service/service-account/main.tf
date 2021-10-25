resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = "projects/-/serviceAccounts/githubsa-280@nodejsapp-324007.iam.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${var.sa_name}"
  ]
}
