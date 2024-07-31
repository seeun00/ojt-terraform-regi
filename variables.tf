# variable "env" {
#     type = string  
# }
variable "region" { 
    # default = "us-east-1"   #사용자가 지정한 region 으로 대체할 예정
    type = string
}

variable "vpc_name" {
    # default = "oneclickinfra-terraform-dev-vpc-test"
    type = string
}

variable "vpc_cidr" {
    type = string
}  

# variable "azs" {
#     type = list(string)
# }

variable "public_subnets" {
    type = list(string)
}

variable "private_subnets" {
    type = list(string)
}

########### ec2 ###########
 variable "ec2_name_suffix" {
   type = string
 }

#  variable "ami" {
#     type = string
#  }

 variable "instance_type" {
    type = string
 }

 variable "ec2_web_name" {
    type = string
 }

variable "ec2_was_name" {
  type = string  
}
########### sg ############
#  variable "vpc_security_group_ids" {
#    type = list(string)
#  }

 variable "security_group_web_name" {
   type = string
 }

 variable "security_group_was_name" {
   type = string
 }

variable "security_group_db_name" {
  type = string
}

########### db ############
variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}
variable "db_port" {
  type = string
}
variable "db_family" {
  type = string
}
variable "db_major_engine_version" {
  type = string
}

########### alb ############
variable "alb_name" {
  type = string
}

########### asg ############
variable "asg_web_name" {
  type = string
}

variable "asg_was_name" {
  type = string
}


variable "launch_template_name" {
  type = string
}
