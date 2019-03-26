variable "name" {
  default     = ""
  description = "The display name for the service principal."
}
# data "azurerm_subscription" "current" {}

variable "end_date" {
  default     = ""
  description = "The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. `2020-01-01T01:02:03Z`). Overrides `years`."
}
