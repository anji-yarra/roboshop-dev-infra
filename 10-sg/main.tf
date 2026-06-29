module "sg" {
    count       = length(var.sg_name)
    source      = "git::https://github.com/anji-yarra/terraform-aws-sg.git//terraform-aws-sg?ref=main"
    project     = var.project
    environment = var.environment
    vpc_id      = local.vpc_id
    sg_name     = replace(var.sg_names[count.index], "-", "-")
}