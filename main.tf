variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/24"
}

# Create a Subnet in the VPC
resource "aws_subnet" "example_subnet1" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.0.0/26" # 첫 번째 1/4
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "example_subnet2" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.0.64/26" # 두 번째 1/4
  availability_zone = "us-west-2b"
}
