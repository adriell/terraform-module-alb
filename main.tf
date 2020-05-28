resource "aws_lb" "default" {
    count = var.enabled ? 1 : 0

    load_balancer_type = "application"

    name                       = var.name
    subnets                    = var.subnet_ids
    internal                   = var.internal
    security_groups            = var.security_groups

    tags = merge(
        map("Name", "${var.name}-alb"),
        var.tags
    )
}

resource "aws_lb_listener" "listener" {
    count = var.enabled ? 1 : 0

    port              = var.listener_port
    protocol          = var.protocol
    certificate_arn   = var.certificate_arn
    load_balancer_arn = aws_lb.default[0].arn

    default_action {
      target_group_arn = aws_lb_target_group.target_group.arn
      type             = var.default_action_type
    }
}

resource "aws_lb_target_group" "target_group" {
    name                 = "${var.name}-tg"
    port                 = var.listener_port
    vpc_id               = var.vpc_id
    protocol             = var.protocol
    deregistration_delay = var.deregistration_delay

    health_check {
      path                = var.health_check_path
      port                = var.health_check_port
      timeout             = var.health_check_timeout
      matcher             = var.health_check_matcher
      interval            = var.health_check_interval
      protocol            = var.health_check_protocol
      unhealthy_threshold = var.health_check_unhealthy_treshold
    }
    tags = merge(
       map("Name", "${var.name}-alb"),
       var.tags
    )

}