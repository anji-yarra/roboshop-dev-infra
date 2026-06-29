variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_name" {
    type        = list
    default     = [
        "mangodb", "redis", "mysql", "rabbitmq",
        "catalogue", "user", "cart", "shipping", "payment", 
        "backend_alb",
        "frontend",
        "frontend_alb",
        "bastion"
    ]
}