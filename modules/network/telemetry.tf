# "Anonymous usage telemetry". Runs during `terraform plan`.
data "external" "telemetry" {
  program = ["sh", "${path.module}/scripts/telemetry.sh"]
}
