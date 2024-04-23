# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "lab_arn" {
  default     = "arn:aws:iam::056977427073:role/LabRole"
}

variable "db_user" {
  default     = "postgres"
}

variable "db_password" {
  default     = "postgres"
}