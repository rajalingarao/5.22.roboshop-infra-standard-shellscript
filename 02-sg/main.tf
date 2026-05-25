module "mongodb_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for MongoDB"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "mongodb"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
  common_tags    = var.common_tags
}

module "redis_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for redis"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "redis"
  #sg_ingress_rules = var.redis_sg_ingress_rules
  common_tags    = var.common_tags
}

module "mysql_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for mysql"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "mysql"
  #sg_ingress_rules = var.mysql_sg_ingress_rules
  common_tags    = var.common_tags
}

module "rabbitmq_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for rabbitmq"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "rabbitmq"
  #sg_ingress_rules = var.rabbitmq_sg_ingress_rules
  common_tags    = var.common_tags
}

module "catalogue_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for catalogue"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "catalogue"
  #sg_ingress_rules = var.catalogue_sg_ingress_rules
  common_tags    = var.common_tags
}

module "user_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for user"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "user"
  #sg_ingress_rules = var.user_sg_ingress_rules
  common_tags    = var.common_tags
}

module "cart_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for cart"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "cart"
  #sg_ingress_rules = var.cart_sg_ingress_rules
  common_tags    = var.common_tags
}

module "shipping_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for shipping"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "shipping"
  #sg_ingress_rules = var.shipping_sg_ingress_rules
  common_tags    = var.common_tags
}

module "payment_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for payment"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "payment"
  #sg_ingress_rules = var.payment_sg_ingress_rules
  common_tags    = var.common_tags
}

module "web_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for web"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "web"
  #sg_ingress_rules = var.web_sg_ingress_rules
  common_tags    = var.common_tags
}
module "dispatch_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for Dispatch"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "dispatch"
  #sg_ingress_rules = var.dispatch_sg_ingress_rules
  common_tags    = var.common_tags
}
module "bastion_sg" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/rajalingarao/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for bastion"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "bastion"
  #sg_ingress_rules = var.bastion_sg_ingress_rules
  common_tags    = var.common_tags
}

# These SG rules

# MongoDB
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.mongodb_sg.sg_id
}
# resource "aws_security_group_rule" "mongodb_ansible" {
#   type                     = "ingress"
#   from_port                = 27017
#   to_port                  = 27017
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.mongodb.sg_id
# }
resource "aws_security_group_rule" "mongodb_catalogue" {

  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = module.catalogue_sg.sg_id
  security_group_id        = module.mongodb_sg.sg_id
}
resource "aws_security_group_rule" "mongodb_user" {

  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = module.user_sg.sg_id
  security_group_id        = module.mongodb_sg.sg_id
}

# Redis
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.redis_sg.sg_id
}
# resource "aws_security_group_rule" "redis_ansible" {
#   type                     = "ingress"
#   from_port                = 6379
#   to_port                  = 6379
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.redis.sg_id
# }
resource "aws_security_group_rule" "redis_catalogue" {

  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = module.catalogue_sg.sg_id
  security_group_id        = module.redis_sg.sg_id
}
resource "aws_security_group_rule" "redis_user" {

  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = module.user_sg.sg_id
  security_group_id        = module.redis_sg.sg_id
}

# Mysql
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}
# resource "aws_security_group_rule" "mysql_ansible" {
#   type                     = "ingress"
#   from_port                = 3306
#   to_port                  = 3306
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.mysql.sg_id
# }

resource "aws_security_group_rule" "mysql_shipping" {

  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.shipping_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}

# RabbitMQ
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.rabbitmq_sg.sg_id
}
# resource "aws_security_group_rule" "rabbitmq_ansible" {
#   type                     = "ingress"
#   from_port                = 5672
#   to_port                  = 5672
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.rabbitmq.sg_id
# }
resource "aws_security_group_rule" "rabbitmq_payment" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  source_security_group_id = module.payment_sg.sg_id
  security_group_id        = module.rabbitmq_sg.sg_id
}


# Catalogue
resource "aws_security_group_rule" "catalogue_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.catalogue_sg.sg_id
}
# resource "aws_security_group_rule" "catalogue_ansible" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.catalogue.sg_id
# }
resource "aws_security_group_rule" "catalogue_cart" {

  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.cart_sg.sg_id
  security_group_id        = module.catalogue_sg.sg_id
}
resource "aws_security_group_rule" "catalogue_web" {

  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.sg_id
  security_group_id        = module.catalogue_sg.sg_id
}


# User
resource "aws_security_group_rule" "user_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.user_sg.sg_id
}
# resource "aws_security_group_rule" "user_ansible" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.user.sg_id
# }
resource "aws_security_group_rule" "user_web" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.sg_id
  security_group_id        = module.user_sg.sg_id
}
resource "aws_security_group_rule" "user_payment" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.payment_sg.sg_id
  security_group_id        = module.user_sg.sg_id
}

# Cart
resource "aws_security_group_rule" "cart_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.cart_sg.sg_id
}
# resource "aws_security_group_rule" "cart_ansible" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.cart.sg_id
# }
resource "aws_security_group_rule" "cart_web" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.sg_id
  security_group_id        = module.cart_sg.sg_id
}
resource "aws_security_group_rule" "cart_shipping" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.shipping_sg.sg_id
  security_group_id        = module.cart_sg.sg_id
}
resource "aws_security_group_rule" "cart_payment" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.payment_sg.sg_id
  security_group_id        = module.cart_sg.sg_id
}

# Shipping
resource "aws_security_group_rule" "shipping_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.shipping_sg.sg_id
}
# resource "aws_security_group_rule" "shipping_ansible" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.shipping.sg_id
# }
resource "aws_security_group_rule" "shipping_web" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.sg_id
  security_group_id        = module.shipping_sg.sg_id
}

# Payment
resource "aws_security_group_rule" "payment_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.payment_sg.sg_id
}
# resource "aws_security_group_rule" "payment_ansible" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.payment.sg_id
# }
resource "aws_security_group_rule" "payment_web" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.sg_id
  security_group_id        = module.payment_sg.sg_id
}

# Web
resource "aws_security_group_rule" "web_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.web_sg.sg_id
}
# resource "aws_security_group_rule" "web_ansible" {
#   type                     = "ingress"
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.web.sg_id
# }
resource "aws_security_group_rule" "web_internet_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = module.web_sg.sg_id
}
resource "aws_security_group_rule" "web_internet_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = module.web_sg.sg_id
}

# Dispatch
resource "aws_security_group_rule" "dispatch_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.dispatch_sg.sg_id
}
# resource "aws_security_group_rule" "dispatch_ansible" {
#   type                     = "ingress"
#   from_port                = 5672
#   to_port                  = 5672
#   protocol                 = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id        = module.dispatch.sg_id
# }
resource "aws_security_group_rule" "rabbitmq_dispatch" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  source_security_group_id = module.dispatch_sg.sg_id
  security_group_id        = module.rabbitmq_sg.sg_id
}
resource "aws_security_group_rule" "dispatch_internet_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = module.dispatch_sg.sg_id
}
resource "aws_security_group_rule" "dispatch_ssh_from_home" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = module.dispatch_sg.sg_id
}

# Bastion
resource "aws_security_group_rule" "bastion_public_22" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = module.bastion_sg.sg_id
}

# Ansible
# resource "aws_security_group_rule" "ansible_public_22" {
#   type                     = "ingress"
#   from_port                = 0
#   to_port                  = 65535
#   protocol                 = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
#   security_group_id        = module.ansible.sg_id
# }
