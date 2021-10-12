resource "google_storage_bucket" "bucket" {
  name = var.bucket_name
}

locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
  root_dir = abspath("../../cloudfunctiondemo")
}

# Zip up source code
data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = local.root_dir
  output_path = "${var.function_name}.zip"
}

# Store ziped code in the bucket
resource "google_storage_bucket_object" "function_zip_bucket_object" {
  name   = "${var.function_name}.${data.archive_file.function_zip.output_base64sha256}.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.function_zip.output_path
  depends_on = [google_storage_bucket.bucket]
}

# Create the cloud function
resource "google_cloudfunctions_function" "function" {
  name         = var.function_name
  description           = var.description != "" ? var.description : "${var.function_name} HTTP Cloud Function"
  trigger_http          = true
  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = var.bucket_name
  source_archive_object = google_storage_bucket_object.function_zip_bucket_object.name
  timeout               = var.timeout
  entry_point           = var.entry_point
  runtime               = var.runtime
  environment_variables = var.environment_variables
  service_account_email = var.service_account_email
  vpc_connector         = var.vpc_connector
  max_instances         = var.max_instances
  region                = var.region
}
# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
