module "network" {
  source = "git::https://github.com/r-morato/tfcap-action-demo.git//modules/network?ref=05fcb42637fe77a1424d8441b1cff02fef127f87"
  name   = "prod"
}

output "network" {
  value = module.network.vpc
}
