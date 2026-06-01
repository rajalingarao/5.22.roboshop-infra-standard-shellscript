# The rule of thumb is:
* Bastion/VPN are for human access to private infrastructure. Security-group rules between application SGs are for service-to-service communication. Production application traffic should not flow through the bastion.

* Notice that the bastion is only for administrators, while the services communicate directly through private security-group rules.

1. What is a Bastion Server?
* A bastion host is a secure jump server used by humans/admins to access private resources.
Purpose:
* SSH into private servers
* Troubleshooting
* Log inspection
* Emergency maintenance
* Running admin commands

Not intended for:
* Frontend → Backend traffic
* Backend → Database traffic
* Service-to-service communication


# Rule 1
resource "aws_security_group_rule" "catalogue_bastion" {
  from_port                = 8080
  to_port                  = 8080
  source_security_group_id = module.bastion_sg.sg_id
}
This means: Bastion ---> Catalogue:8080
The bastion machine can access the catalogue application.
Useful for:
curl http://catalogue:8080/products
Testing whether the service is running.

# Rule 2
resource "aws_security_group_rule" "catalogue_bastion_ssh" {
  from_port                = 22
  to_port                  = 22
  source_security_group_id = module.bastion_sg.sg_id
}
Means: Bastion ---> Catalogue:22
Allows SSH access.
ssh ec2-user@catalogue
This is the primary purpose of a bastion.

# Rule 3
resource "aws_security_group_rule" "catalogue_cart" {
  from_port                = 8080
  to_port                  = 8080
  source_security_group_id = module.cart_sg.sg_id
}
Means: Cart Service ---> Catalogue Service
This is application-to-application communication.
Example:
Cart Service
    |
    | GET /product/123
    v
Catalogue Service
This has nothing to do with bastion.

# Rule 4
resource "aws_security_group_rule" "catalogue_web" {
  from_port                = 8080
  to_port                  = 8080
  source_security_group_id = module.web_sg.sg_id
}
Means:
Web ---> Catalogue
Frontend/backend communication.
Again, not related to bastion.


# Then Why Allow Bastion to Access DB?
Commonly:
Bastion ---> MySQL :3306
Only for administrators.

Example:
mysql -h mysql.internal

* Use cases:
* Checking data
* Running migrations
* Troubleshooting
* Backup verification
* Not for production application traffic.


* Applications running inside the same VPC should communicate directly using private IPs, DNS names, load balancers, service discovery, and security groups.


# Real-world Usage

* Use Bastion when:
* Small team
* Need occasional SSH access
* Simple setup
* Learning environments and small projects

* Use VPN when:
* Many engineers need access
* Developers need to access databases, internal APIs, dashboards, etc.
* Enterprise environments
* Hybrid cloud/on-prem connectivity

* A good one-line summary:
* A bastion is a single machine you jump through; a VPN makes your device part of the private network. 