variable "project_id" {
  description = "The ID of an Google Project "
  type =string
  default = ""
}
variable "region" {
  description = "Region"
  type = string
  default = ""
}
variable "zone" {
  description = "zone"
  type = string
  default = ""
}
variable "scheduler_name" {
  description = "name of cloud scheduler "
  type =string
  default = "cloudscheduler"
}
variable "scheduler_cron" {
  description = "Cron Schedule for cloud scheduler"
  type = string
  default = "0/10 * * * *"
}
variable "scheduler_time_zone" {
  description = "Time zone for cloud scheduler"
  type = string
  default = "Europe/London"
}
variable "bucket_name" {
  type        = string
  description = "Name of GCS bucket to use to store the Cloud Functions their contents on."
  default     = ""
}

variable "function_name" {
  type        = string
  description = "A user-defined name of the function. Function names must be unique globally."
  default     = "cloudfunction"
}

variable "source_dir" {
  type        = string
  description = "Source directory containing the function source files. Its contents will be zipped and uploaded to the given `bucket_name`"
  default     = "" # "./cloudfunctions/${var.name}"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the function."
  default     = "" # ${var.name} HTTP Cloud Function"
}

variable "runtime" {
  type        = string
  description = "(Optional) The runtime in which the function is going to run. One of `nodejs6`, `nodejs8`, `nodejs10`, `python37`, `go111`. Default value is `python37`."
  default     = "nodejs14"
}

variable "entry_point" {
  type        = string
  description = "(Optional) Name of the function that will be executed when the Google Cloud Function is triggered. Default value is `__main__`"
  default     = "__main__"
}

variable "available_memory_mb" {
  type        = number
  description = "(Optional) Memory (in MB), available to the function. Default value is 128. Allowed values are: 128, 256, 512, 1024, and 2048."
  default     = 256
}

variable "timeout" {
  type        = number
  description = "(Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 540
}

variable "environment_variables" {
  type        = map
  description = "(Optional) A set of key/value environment variable pairs to assign to the function."
  default     = {}
}

variable "vpc_connector" {
  type        = string
  description = "(Optional) If provided, the vpc connector to use"
  default     = null
}

variable "max_instances" {
  type        = number
  description = "(Optional) Limit the degree to which your function will scale in response to incoming requests."
  default     = null
}
variable "gcp_service_list" {
  description = "The service_account_name of an Google Project"
  type = list
  default =  [
 #  "iam.googleapis.com",                     # Identity and Access Management (IAM) API
 #  "cloudresourcemanager.googleapis.com",     #Cloud Resource Manager API
 #  "run.googleapis.com",                     # Cloud Run API
   "cloudfunctions.googleapis.com",          # Cloud Function API
 ]
}
variable "service_account_name" {
  description = "The service_account_name of an Google Project"
  type = string
  default = ""
}
variable "account_id" {
  description = "The id of an Google Project"
  type = string
  default = ""
}
variable "sa_name" {
  description = "sa_name"
  type =string
  default = ""
}

# variable "pipeline_sa" {
#   description = "pipeline_sa"
#   type = string
#   default = ""
# }
variable "api_path" {
  description = "api_path"
  type = string
  default = ""
}

