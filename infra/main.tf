module "network" {
  source = "git::https://github.com/r-morato/tfcap-action-demo.git//modules/network?ref=b96001e743ef19ce2408902286498303f745faa5"
  name   = "prod"
}

output "network" {
  value = module.network.vpc
}
