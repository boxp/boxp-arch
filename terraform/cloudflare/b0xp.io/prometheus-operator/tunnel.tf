data "aws_ssm_parameter" "prometheus_operator_tunnel_secret" {
  name = "prometheus-operator-tunnel-secret"
}

# Creates a new locally-managed tunnel for the GCP VM.
resource "cloudflare_tunnel" "prometheus_operator_tunnel" {
  account_id = var.account_id
  name       = "cloudflare prometheus-operator tunnel"
  secret     = sensitive(data.aws_ssm_parameter.prometheus_operator_tunnel_secret.value)
}
