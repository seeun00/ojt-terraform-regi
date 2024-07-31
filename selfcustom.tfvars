
# vpc_name = "oneclickinfra-vpc-dev-test"

vpc_cidr = "10.0.0.0/16"

public_subnets = ["10.0.10.0/24", "10.0.20.0/24"]

private_subnets = ["10.0.30.0/24", "10.0.40.0/24", "10.0.50.0/24", "10.0.100.0/24"]


################################################################ ...only vpc test...
########### ec2 ###########
/*
ec2_name_suffix = "ec2"

# ami = "ami-0d8c01579fcb76052"               #대박.... 리전마다 존재하는 이미지의 AMI 아이디 다름

instance_type = "t2.micro"

ec2_web_name = "ec2-web"
ec2_was_name = "ec2-was"
############# sg ############4-
security_group_web_name = "security-group-web"

security_group_was_name = "security-group-was"

security_group_db_name = "security-group-db"

############# db ############4-
db_identifier = "db"

db_engine = "mysql"

db_engine_version = "8.0.35"

db_name = "mydb"

db_username = "admin"

db_password = "password"

db_port = "3306"

db_family = "mysql8.0"

db_major_engine_version = "8.0"

########### alb ###########
alb_name = "alb"

########### asg ###########
asg_web_name = "asg-ec2-web"

asg_was_name = "asg-ec2-was"

launch_template_name = "launch_tamplate"
*/