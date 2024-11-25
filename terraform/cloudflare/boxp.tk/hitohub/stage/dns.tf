resource "cloudflare_page_rule" "redirect_top" {
  zone_id  = var.zone_id         # ドメインのzone ID
  target   = "https://hitohub.boxp.tk/*" # リダイレクト元
  priority = 1                   # ルールの優先度

  actions {
    forwarding_url {
      url         = "https://hitohub.b0xp.io" # リダイレクト先URL
      status_code = 301                   # 301リダイレクト
    }
  }
}
