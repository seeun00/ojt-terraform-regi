# output vpc_id {
#     value = module.vpc.vpc_id
# }

# output vpc_name {
#     value = module.vpc.name
# }

################################################################# ...only vpc test...

/*
output public_subnets_ids {
    value = module.vpc.public_subnets
}

output private_subnets_ids {
    value = module.vpc.private_subnets
}

output security_group_web_id {
    value = module.security_group_web.security_group_id
}

data "aws_caller_identity" "current" {}
output "account_id" {
  description = "The AWS account ID."
  value       = data.aws_caller_identity.current.account_id
}

data "aws_region" "current" {} 
output region {
    value = data.aws_region.current.name
}

*/