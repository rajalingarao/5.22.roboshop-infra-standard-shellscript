variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Component = "sg"
    Environment = "dev"
    Terraform = "true"
  }
}
