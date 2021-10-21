variable "scheduler_name" {
  description = "name of cloud scheduler "
  type =string
  default = ""
}
variable "scheduler_cron" {
  description = "Cron Schedule for cloud scheduler"
  type = string
  default = ""
}
variable "scheduler_time_zone" {
  description = "Time zone for cloud scheduler"
  type = string
  default = ""
}
variable "url" {
  description = "url for cloud function"
  type = string
  default = ""
}
variable "service_account_email" {
  type        = string
  description = "(Optional) If provided, the self-provided service account to run the scheduler with."
  default     = ""
}
variable "api_path" {
  description = "api_path"
  type = string
  default = ""
}
