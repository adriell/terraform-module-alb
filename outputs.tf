output "alb_id" {
  value       = join("",aws_lb.default.*.id)
  description = "ARN do load balancer."
}

output "alb_dns_name" {
  value       = join("",aws_lb.default.*.dns_name)
  description = "Nome do DNS do load balancer."
}

output "alb_target_group_name" {
  value       = aws_lb_target_group.target_group.name
  description = "Nome do target group"
}