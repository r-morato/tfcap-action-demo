variable "name" {
  type = string
}

# Stand-in for real VPC resources, so nothing needs cloud credentials.
resource "terraform_data" "vpc" {
  input = {
    name = var.name
    cidr = "10.0.0.0/16"
  }
}

output "vpc" {
  value = terraform_data.vpc.output
}
