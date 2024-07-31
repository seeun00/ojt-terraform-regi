
# locals {
#   region = sys.env.AWS_DEFAULT_REGION
# }

module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.9.0"

    name = var.vpc_name
    cidr= var.vpc_cidr
    azs = ["${var.region}a", "${var.region}b"]

    public_subnets = var.public_subnets
    private_subnets = var.private_subnets

    #enable_nat_gateway = true
    #single_nat_gateway = true

    tags = {
    }
}
################################################################# ...only vpc test...

# module "security_group_web" {
#     source  = "terraform-aws-modules/security-group/aws"
#     version = "5.1.2"

#     name = var.security_group_web_name
#     vpc_id = module.vpc.vpc_id

#     ingress_cidr_blocks = ["0.0.0.0/0"]
#     ingress_rules       = ["http-80-tcp", "https-443-tcp"]
#     egress_rules        = ["all-all"]
# }
 
# module "security_group_was" {
#     source  = "terraform-aws-modules/security-group/aws"
#     version = "5.1.2"

#     name = var.security_group_was_name
#     vpc_id = module.vpc.vpc_id

#     ingress_with_source_security_group_id = [
#         {
#             rule = "all-all"
#             source_security_group_id = module.security_group_web.security_group_id
#         }
#     ]
#     egress_rules        = ["all-all"]
# }

# module "security_group_db" {
#     source  = "terraform-aws-modules/security-group/aws"
#     version = "5.1.2"

#     name = var.security_group_db_name
#     vpc_id = module.vpc.vpc_id

#     ingress_with_source_security_group_id = [
#         {   
#             description = "Ingress from WAS servers"
#             from_port = 3306
#             to_port = 3306
#             protocol = "tcp"
#             source_security_group_id = module.security_group_was.security_group_id
#         }
#     ]
#     egress_rules        = ["all-all"]

# }

# # module "ec2_instance" {
# #     source  = "terraform-aws-modules/ec2-instance/aws"
# #     version = "5.6.1"

# #     for_each = {
# #         web = {
# #             subnet_id = module.vpc.public_subnets[0]
# #             vpc_security_group_ids = [module.security_group_web.security_group_id]
# #         }
# #         was = {
# #             subnet_id = module.vpc.private_subnets[0]
# #             vpc_security_group_ids = [module.security_group_was.security_group_id]
# #         }
# #     }

# #     name = "${each.key}-${var.ec2_name_suffix}"
# #     instance_type = var.instance_type
# #     ami = var.ami

# #     subnet_id = each.value.subnet_id
# #     vpc_security_group_ids = each.value.vpc_security_group_ids

# #     tags = {

# #     }
# # }

# data "aws_ami" "linux_ami" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-gp2"]
#   }
# }

# # module "ec2_web" {
# #     source  = "terraform-aws-modules/ec2-instance/aws"
# #     version = "5.6.1"

# #     subnet_id = module.vpc.public_subnets[0]
# #     vpc_security_group_ids = [module.security_group_web.security_group_id]
# #     name = var.ec2_web_name
# #     instance_type = var.instance_type
# #     ami = data.aws_ami.linux_ami.id
# # }

# # module "ec2_was" {
# #     source  = "terraform-aws-modules/ec2-instance/aws"
# #     version = "5.6.1"

# #     subnet_id = module.vpc.private_subnets[0]
# #     vpc_security_group_ids = [module.security_group_was.security_group_id]
# #     name = var.ec2_was_name
# #     instance_type = var.instance_type
# #     ami = data.aws_ami.linux_ami.id
# # }

# module "db" {
#   source  = "terraform-aws-modules/rds/aws"
#   version = "6.8.0"
  
#   identifier = var.db_identifier
  
#   engine = var.db_engine
#   engine_version = var.db_engine_version
#   instance_class = "db.t3.micro"
#   allocated_storage = 20
#   storage_encrypted = true

#   db_name = var.db_name
#   username = var.db_username
#   password = var.db_password
#   port = var.db_port

# #   subnet_ids = [module.vpc.private_subnets[0]]
#   create_db_subnet_group = true
#   subnet_ids = [module.vpc.private_subnets[2], module.vpc.private_subnets[3]]
#   multi_az = false
  
#   vpc_security_group_ids = [module.security_group_db.security_group_id]

#   family = var.db_family
#   major_engine_version = var.db_major_engine_version
#   skip_final_snapshot = "true"
# }

# #############################

# # module "alb" {
# #   source  = "terraform-aws-modules/alb/aws"
# #   version = "9.8.0"

# #   name = var.alb_name
# #   vpc_id = module.vpc.vpc_id
# #   subnets = [var.public_subnets[0], var.public_subnets[1]]
# #   security_group_ingress_rules = {
# #     all_http = {
# #       from_port   = 80
# #       to_port     = 80
# #       ip_protocol = "tcp"
# #       description = "HTTP web traffic"
# #       cidr_ipv4   = "0.0.0.0/0"
# #     }
# #     all_https = {
# #       from_port   = 443
# #       to_port     = 443
# #       ip_protocol = "tcp"
# #       description = "HTTPS web traffic"
# #       cidr_ipv4   = "0.0.0.0/0"
# #     }
# #   }
# #   security_group_egress_rules = {
# #     all = {
# #       ip_protocol = "-1"
# #       cidr_ipv4   = "10.0.0.0/16"
# #     }
# #   }
# #   listeners = {
# #     http_listeners = {
# #         port=80
# #         protocol="HTTP"
# #         # target_group_index=0
        
# #         forward = {
# #             target_group_key = "tg-instance"
# #       }
# #     }
# #   }
# #   target_groups = {
# #     tg-instance = {
# #       name_prefix      = "h1"
# #       protocol         = "HTTP"
# #       port             = 80
# #       target_type      = "instance"
# #     }
# #   }
# # }

# module "asg_web" {
#   source  = "terraform-aws-modules/autoscaling/aws"
#   version = "7.7.0"
#   name = var.asg_web_name
#   min_size = 2
#   max_size = 4
#   desired_capacity          = 2
#   wait_for_capacity_timeout = 0
#   health_check_type         = "EC2"
#   vpc_zone_identifier       = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]

#   launch_template_name = var.launch_template_name
#   image_id = data.aws_ami.linux_ami.id
#   instance_type = var.instance_type
# }
  
# module "asg_was" {
#   source  = "terraform-aws-modules/autoscaling/aws"
#   version = "7.7.0"
#   name = var.asg_was_name
#   min_size = 2
#   max_size = 4
#   desired_capacity          = 2
#   wait_for_capacity_timeout = 0
#   health_check_type         = "EC2"
#   vpc_zone_identifier       = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]

#   launch_template_name = var.launch_template_name
#   image_id = data.aws_ami.linux_ami.id
#   instance_type = var.instance_type
# }
