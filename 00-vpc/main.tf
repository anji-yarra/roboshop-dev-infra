module "vpc" {
    source = "git::https://github.com/anji-yarra/terraform-aws-vpc.git//terraform-aws-vpc?ref=main"
    project = var.project
    environment = var.environment
    is_peering_required = false
}