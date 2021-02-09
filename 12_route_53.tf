resource "aws_route53_record" "frontend-subdomain" {
    zone_id = var.frontend_awesome_rush_b_domain_zone_id
    name    = var.frontend_subdomain_name
    type    = "A"
    ttl = 300	
    records = [ aws_instance.ec2_frontend_instance.public_ip ]
}

resource "aws_route53_record" "backend-subdomain" {
    zone_id = var.backend_awesome_rush_b_domain_zone_id
    name    = var.backend_subdomain_name
    type    = "A"
    ttl = 300	
    records = [ aws_instance.ec2_backend_instance.public_ip ]
}