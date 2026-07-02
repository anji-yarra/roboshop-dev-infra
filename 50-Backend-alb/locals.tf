
locals {

    backend_alb_sg_id       = data.aws_ssm_parameter.backend_alb_sg_id.value
    private_subnet_ids      = split(",", data.aws_ssm_parameter.private.private_subnet_ids)
    common_name             = "${var.project}-${var.environment}"
    common_tags             = {
        Project             = "${var.project}"
        Environment         = "{var.environment}"
        Terraform           = "true"
        
    }

}