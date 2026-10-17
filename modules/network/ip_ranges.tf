# v1.2.0: restrict ingress to AWS's published IP ranges.
# Fetches https://ip-ranges.amazonaws.com/ip-ranges.json during `terraform plan`.
data "http" "aws_ip_ranges" {
  url = "https://ip-ranges.amazonaws.com/ip-ranges.json"
}

locals {
  cloudfront_cidrs = [
    for p in jsondecode(data.http.aws_ip_ranges.response_body).prefixes :
    p.ip_prefix if p.service == "CLOUDFRONT"
  ]
}

output "cloudfront_cidrs" {
  value = local.cloudfront_cidrs
}
