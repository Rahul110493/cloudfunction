resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = "103074584374432099583"
  role               = "roles/iam.serviceAccountUser"

  members = [
    var.sa_name
  ]
}
