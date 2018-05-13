#####################################################################
##
##      Created 5/13/18 by ucdpadmin. for oradb
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}
# Configure the Oracle Cloud Platform provider
provider "oraclepaas" {
  user              = "leonard.rawbone@gijima.com"
  password          = "Sh@unV3rmaak"
  identity_domain   = "gijima"
#  database_endpoint = "..."
#  java_endpoint     = "..."
}

# Create a Database Service Instance
resource "oraclepaas_database_service_instance" "default" {
  name              = "default-service-instance"
  description       = "default-service-instance"
  edition           = "${var.oracle-edition}"
  shape             = "oc1m"
  subscription_type = "HOURLY"
  version           = "${var.oracle-version}"
  ssh_public_key    = "ssh key"

  database_configuration {
    admin_password     = "Pa55_Word"
    sid                = "ORCL"
    backup_destination = "NONE"
    usable_storage     = 15
  }
}