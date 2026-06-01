variable "project_name" {
  default = "roboshop"
}
variable "environment" {
  default = "dev"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    Component = "payment"
    Environment = "dev"
    Terraform = "true"
  }
}
variable "zone_id" {
  default = "Z012785114HGZTDQ8KSQH"
}
variable "domain_name" {
  default = "lithesh.shop"
}