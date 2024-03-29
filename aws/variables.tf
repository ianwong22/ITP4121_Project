# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "lab_arn" {
  default     = "arn:aws:iam::056977427073:role/LabRole"
}