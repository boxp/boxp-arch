# Cloudflareに追加するドメイン情報
resource "cloudflare_zone" "boxp_tk" {
  account = {
    id = var.account_id
  }
  name = "boxp.tk"  # ドメイン名
}
