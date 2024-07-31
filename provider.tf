provider "aws" {
  region = var.region  #-> CodeBuild 에서 이것도 환경변수화
}
# terraform {
#   backend "s3" {
#     bucket         = "seeunojt-s3-test-mine"   #고객계정 seeunojt-s3-test-mine. 고객 키값으로 로그인함 => 고객의 s3여야
#     key            = "env/dev/terraform.tfstate"
#     region         = "ap-northeast-3"
#     encrypt        = true
#   }
# }
