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
}

resource "cloudflare_record" "dhiller_cname_www" {
    domain = "${var.cloudflare_domain}"
    name = "www.${var.cloudflare_domain}"
    value = "${var.cloudflare_cname_destination}."
    type = "CNAME"
    ttl = 300
}

resource "cloudflare_record" "dhiller_mx_1" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mx1.${var.cloudflare_mx_destination}."
    type = "MX"
    ttl = 300
    priority = 10
}

resource "cloudflare_record" "dhiller_mx_2" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mx2.${var.cloudflare_mx_destination}."
    type = "MX"
    ttl = 300
    priority = 20
}
