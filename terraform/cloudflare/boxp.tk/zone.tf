# Cloudflareに追加するドメイン情報
resource "cloudflare_zone" "boxp_tk" {
  account_id = var.account_id # CloudflareのアカウントID
  zone       = "boxp.tk"      # ドメイン名
}
