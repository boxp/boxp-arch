data "cloudflare_tunnel" "prometheus_operator_tunnel" {
  account_id = var.account_id
  name       = var.tunnel_name
}
