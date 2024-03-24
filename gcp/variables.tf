variable "project_id" {
    type        = string
    description = "Project ID"
    default     = "ian-itp4121-multicloud-project"
 }

variable "credentials_file" {
    default = ["..//key/google_service_account.json"]
 }

variable "region" {
  type         = string
  description  = "Region for this infrastructure"
  default      = "asia-east2"
}

variable "zone" {
  type         = string
  description  = "Zone for the infrastructure"
  default      = "asia-east2-a"
}

variable "ip_private_cidr_range" {
  type          = list(string)
  description   = "List of The range of internal aaddresses that by this public subnetwork."
  default       = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

variable "ip_public_cidr_range" {
  type          = list(string)
  description   = "List of The range of internal addresses that by this public subnetwork."
  default       = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
}

