output "url" {
 description = "url"
 value = google_cloudfunctions_function.function.https_trigger_url+"/api/portfolio"
}
