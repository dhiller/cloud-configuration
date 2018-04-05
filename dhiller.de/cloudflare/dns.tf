provider "cloudflare" {
    email = "${var.cloudflare_email}"
    token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "dhiller_cname" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "${var.cloudflare_cname_destination}."
    type = "CNAME"
    ttl = 300
    proxied = true
}

resource "cloudflare_record" "dhiller_cname_www" {
    domain = "${var.cloudflare_domain}"
    name = "www.${var.cloudflare_domain}"
    value = "${var.cloudflare_cname_destination}."
    type = "CNAME"
    ttl = 300
    proxied = true
}

resource "cloudflare_record" "dhiller_cname_email" {
    domain = "${var.cloudflare_domain}"
    name = "email.${var.cloudflare_domain}"
    value = "${var.cloudflare_mx_destination}"
    type = "CNAME"
    ttl = 300
    proxied = true
}

resource "cloudflare_record" "dhiller_mx_a" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mxa.${var.cloudflare_mx_destination}"
    type = "MX"
    ttl = 300
    priority = 10
}

resource "cloudflare_record" "dhiller_mx_b" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mxb.${var.cloudflare_mx_destination}"
    type = "MX"
    ttl = 300
    priority = 10
}

resource "cloudflare_record" "dhiller_txt" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "v=spf1 include:${var.cloudflare_mx_destination} ~all"
    type = "TXT"
    ttl = 300
}

resource "cloudflare_record" "dhiller_txt_k1" {
    domain = "${var.cloudflare_domain}"
    name = "k1._domainkey.${var.cloudflare_domain}"
    value = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDXDx6d0xHeoaZvpNoYPGNhjKXke9qFLE/BoEsMeEmCEdWmugizr+FpA4C04ey+finBgNlD9aJZBJ+/LP29JTDdagRBZEUImtHcZOwF6VwVqYfTGsV0t0VrXXbNceD91maGFP8j0U0b65CG0mdySDjXiTTvP6vQQhS1UMOEDqlNQQIDAQAB"
    type = "TXT"
    ttl = 300
}
