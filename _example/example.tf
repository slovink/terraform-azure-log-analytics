provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "git@github.com:slovink/terraform-azure-resource-group.git?ref=1.0.0"
  name        = "app2"
  environment = "test"
  location    = "North Europe"
}

module "log-analytics" {
  source                           = "./../"
  name                             = "app"
  environment                      = "test"
  resource_group_name              = module.resource_group.resource_group_name
  log_analytics_workspace_location = module.resource_group.resource_group_location

}
