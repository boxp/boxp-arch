data "aws_ssm_parameter" "prometheus_operator_tunnel_secret" {
  name = "prometheus-operator-tunnel-secret"
}

# Creates a new locally-managed tunnel for the GCP VM.
resource "cloudflare_tunnel" "prometheus_operator_tunnel" {
  account_id = var.account_id
  name       = "cloudflare prometheus-operator tunnel"
  secret     = sensitive(base64sha256(data.aws_ssm_parameter.prometheus_operator_tunnel_secret.value))
}

resource "aws_ssm_parameter" "prometheus_operator_tunnel_token" {
  name        = "prometheus-operator-tunnel-token"
  description = "for prometheus-operator tunnel token"
  type        = "SecureString"
  value       = sensitive(cloudflare_tunnel.prometheus_operator_tunnel.tunnel_token)
}
