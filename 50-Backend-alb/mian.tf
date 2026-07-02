resource "aws_lb" "backend_alb" {
    name            = "${local.common_name}-backend-alb"
    internal            = true
    load_balancer_type  = "application"
    securitt_groups     = [local.backend_alb_sg_id]
    subnets             = local.private_subnet_ids

    enable_deletion_protection = false

    tags = merge(
        {
            Name = "${local.common_name}-backend_alb"
        }
    )
}

resourse "aws_lb_listener" "http" {

    load_balancer_arn       = aws_lb.backend_alb.load_balancer_arn
    port                    = "80"
    protocol                = "HTTP"

    default_action {
        type = "fixed-response"

            fixed_response {
                content_type    = "text/html"
                message_body    = "<h1> Hi, I'm from HTTP backend ALB </h1>"
                status_code     = "200"
            }
    }
}

resource "aws_route53_record" "www" {

    zone_id         = var.zone_id
    name            = "*.backend-alb-${var.environment}.anjidevops.online"
    type            = "A"

    alias {

        name        = aws_lb.backend_alb.dns_name
        zone_id     = aws_lb.backend_alb.zone_id
        evaluated_target_health = true
    }
    allow_overwrite = true
}