module "aws" {
    source          = "./aws"
}

locals {
  azure_credentials = jsondecode(file("/key/azure_rbac.txt"))
}

module "azure" {
  source          = "./azure"
  appId           = local.azure_credentials.appId
  password        = local.azure_credentials.password
}

module "gcp" {
  source          = "./gcp"
}