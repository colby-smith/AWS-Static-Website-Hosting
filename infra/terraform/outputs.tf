output "route53_name_servers" {
  description = "Route 53 name servers to configure at 123Reg."
  value       = aws_route53_zone.main.name_servers
}

output "route53_zone_id" {
  description = "Route 53 hosted zone ID."
  value       = aws_route53_zone.main.zone_id
}
output "acm_certificate_arn" {
  description = "ACM certificate ARN for the CloudFront distribution."
  value       = aws_acm_certificate_validation.website.certificate_arn
}