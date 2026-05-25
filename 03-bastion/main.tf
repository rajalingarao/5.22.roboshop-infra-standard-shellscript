resource "aws_instance" "bastion_instance" {
    ami           = data.aws_ami.ami_info.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
    subnet_id = local.public_subnet_id
    user_data = file("bastion.sh")
    root_block_device {
        volume_type           = "gp3"
        volume_size           = 50
        delete_on_termination = true
    }
    tags = merge(
      {
        Name = "${var.project_name}-${var.environment}-bastion"
      },
      var.common_tags
    )
}
resource "aws_route53_record" "bastion_instance_r53" {
    zone_id = var.zone_id
    name    = "bastion.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.bastion_instance.public_ip]
    allow_overwrite = true
}












# module "bastion_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.ami_info.id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
#   # it should be in Roboshop DB subnet
#   subnet_id = local.public_subnet_id

#   tags = merge(
#     {
#         Name = "${var.project_name}-${var.environment}-bastion"
#     },
#     var.common_tags
#   )
# }

# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "2.11.1"
#   #zone_name = var.zone_name
#   records = [
#     {
#         name    = "bastion"
#         type    = "A"
#         ttl     = 1
#         records = [
#             module.bastion_instance.public_ip
#         ]
#     }
#   ]
# }