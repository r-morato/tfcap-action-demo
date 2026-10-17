module "network" {
  source = "git::https://github.com/r-morato/tfcap-action-demo.git//modules/network?ref=6833748da7bc651c5623a46626a3e2dc935bb4d8"
  name   = "prod"
}

output "network" {
  value = module.network.vpc
}
