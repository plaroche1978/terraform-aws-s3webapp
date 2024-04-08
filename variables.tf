# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {}
variable "prefix" {}
variable "name" {}
variable "project_number" {
  description = "Project Number for those resources"
  type        = number
  default     = 234556
}
variable "owner" {
  description = "Owner of the solution"
  type        = string
  default     = "Pascal Laroche"
}
