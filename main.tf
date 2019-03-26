resource "random_string" "password" {
  length = 32
}

resource "random_id" "name" {
  byte_length = 16
  prefix      = "terraform"
}
resource "azuread_application" "aks_app" {
  name = "${var.name}"
}

resource "azuread_service_principal" "aks_sp" {
  application_id = "${azuread_application.aks_app.application_id}"
  tags = ["terraform: true"]
}


resource "azuread_service_principal_password" "test" {
  service_principal_id = "${azuread_service_principal.aks_sp.id}"
  value                = "${random_string.password.result}"
  end_date_relative = "8760h"  # 1 year (parser only works in hours which is stupid)
        
}

output "application_id" {
  description = "The Application ID."
  value       = "${azuread_application.aks_app.application_id}"
}

output "password" {
  description = "The Password for this Service Principal."
  value       = "${random_string.password.result}"
  sensitive   = true
}
