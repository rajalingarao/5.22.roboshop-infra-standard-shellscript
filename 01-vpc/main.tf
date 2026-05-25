module "vpc" {
  
  source = "git::https://github.com/rajalingarao/5.16.terraform-aws-vpc-roboshop.git?ref=main"
    project = var.project_name
    environment = var.environment
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
    is_peering_required = true

}