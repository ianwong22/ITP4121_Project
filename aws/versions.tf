# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6.2"
    }
  }
  required_version = ">= 0.14"
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["../key/aws_credentials.ini"]
}