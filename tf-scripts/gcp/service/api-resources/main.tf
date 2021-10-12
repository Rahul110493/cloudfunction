resource "google_project_service" "project-apis" {
  for_each = toset(var.gcp_service_list)
  service = each.value
  disable_dependent_services = true
}
