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
