resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.service_account_name
}
