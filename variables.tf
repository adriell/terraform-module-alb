variable "enabled"{
    description = "Habilita a criação do ALB"
    type        = bool
    default     = true
}

variable "create_http_listener_rule"{
    description = "Habilita a criação de um custom listener"
    type        = bool
    default     = false
}

variable "listener_arn" {
    description = "Listener existe para adicionar a rule"
    type        = string
    default     = null
}

variable "host_header" {
    description = "Host para adicionar na listener rule"
    type        = string
    default     = null
}

variable "name" {
    description = "Nome do ALB"
    type        = string
}

variable "vpc_id" {
    description = "ID da VPC"
    type        = string
}

variable "subnet_ids" {
    description = "Lista com IDs das subnets onde o ALB será provisionado"
    type        = list(string)
    default     = null
}

variable "internal" {
    description = "Tipo do ALB"
    type        = bool
    default     = false
}

variable "security_groups" {
    description = "Lista com IDs dos security_groups"
    type        = list(string)
}

variable "listener_port" {
    description = "Porta para o Listener do ALB"
    type        = string
    default     = "80"
}

variable "protocol" {
    description = "Protocolo do Listener ALB"
    type        = string
    default     = "HTTP"
}

variable "certificate_arn" {
    description = "ARN do Certificado SSL"
    type        = string
    default     = null
}

variable "default_action_type" {
    description = "Ação default do listener"
    type        = string
    default     = "forward"
}

variable "deregistration_delay" {
    description = "Delay do saida do registro do target group"
    type        = number
    default     = 60
}

variable "health_check_path" {
    description = "Health check do target group"
    type        = string
}

variable "health_check_port" {
    description = "Porta do health check"
    type        = string
    default     = "traffic-port"
}

variable "health_check_timeout" {
    description = "Timeout do health check"
    type        = number
    default     = 3
}

variable "health_check_matcher" {
    description = "Matcher do health check"
    type        = number
    default     = 200
}

variable "health_check_interval" {
    description = "Valor do intervalo de health check"
    type        = number
    default     = 5
}

variable "health_check_protocol" {
    description = "Protocolo do health check"
    type        = string
    default     = "HTTP"
}

variable "health_check_unhealthy_treshold" {
    description = "Limite para o target ficar unhealthy"
    type        = number
    default     = 2   
}

variable "tags" {
    description = "Map de tags"
    type        = map(string)
    default     = {}
}

variable "load_balancer_arn" {
    description = "Para adicionar apenas o listener em um load balancer existente, basta informar o arn do LB"
    type        = string
    default     = null
}