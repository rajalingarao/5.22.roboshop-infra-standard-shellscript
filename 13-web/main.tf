resource "aws_instance" "web_instance" {
    ami           = data.aws_ami.ami_info.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
    subnet_id = local.public_subnet_id
    user_data = file("web.sh")
    root_block_device {
        volume_type           = "gp3"
        volume_size           = 50
        delete_on_termination = true
    }
    tags = merge(
      {
        Name = "${var.project_name}-${var.environment}-web"
      },
      var.common_tags
    )
}
resource "aws_route53_record" "web_instance_r53" {
    zone_id = var.zone_id
    name    = "web.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.web_instance.public_ip]
    allow_overwrite = true
}
















# module "web_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.ami_info.id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
#   # it should be in Roboshop DB subnet
#   subnet_id = local.public_subnet_id
#   user_data = file("web.sh")
#   tags = merge(
#     {
#       Name = "${var.project_name}-${var.environment}-web"
#     },
#     var.common_tags
#   )
# }

# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "2.11.1"

#   zone_name = var.zone_name
#   records = [
#     {
#         name    = "web"
#         type    = "A"
#         ttl     = 1
#         records = [
#             module.web_instance.public_ip
#         ]
#     }
#   ]
# }