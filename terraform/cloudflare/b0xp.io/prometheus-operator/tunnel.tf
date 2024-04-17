data "aws_ssm_parameter" "prometheus_operator_tunnel_secret" {
  name = "prometheus-operator-tunnel-secret"
}

resource "cloudflare_tunnel" "prometheus_operator_tunnel" {
  account_id = var.account_id
  name       = "cloudflare prometheus-operator tunnel"
  secret     = sensitive(base64encode(data.aws_ssm_parameter.prometheus_operator_tunnel_secret.value))
}

resource "aws_ssm_parameter" "prometheus_operator_tunnel_token" {
  name        = "prometheus-operator-tunnel-token"
  description = "for prometheus-operator tunnel token"
  type        = "SecureString"
  value       = sensitive(cloudflare_tunnel.prometheus_operator_tunnel.tunnel_token)
}
