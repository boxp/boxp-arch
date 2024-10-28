resource "cloudflare_page_rule" "redirect_top" {
  zone_id  = var.zone_id         # ドメインのzone ID
  target   = "https://boxp.tk/*" # リダイレクト元
  priority = 1                   # ルールの優先度

  actions {
    forwarding_url {
      url         = "https://www.b0xp.io" # リダイレクト先URL
      status_code = 301                   # 301リダイレクト
    }
  }
}

resource "cloudflare_page_rule" "redirect_www" {
  zone_id  = var.zone_id             # ドメインのzone ID
  target   = "https://www.boxp.tk/*" # リダイレクト元
  priority = 1                       # ルールの優先度

  actions {
    forwarding_url {
      url         = "https://www.b0xp.io" # リダイレクト先URL
      status_code = 301                   # 301リダイレクト
    }
  }
}
