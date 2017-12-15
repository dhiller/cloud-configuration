provider "cloudflare" {
    email = "${var.cloudflare_email}"
    token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "skyconqueror_cname" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "${var.cloudflare_cname_destination}"
    type = "CNAME"
    ttl = 300
}

resource "cloudflare_record" "skyconqueror_cname_www" {
    domain = "${var.cloudflare_domain}"
    name = "www.${var.cloudflare_domain}"
    value = "${var.cloudflare_cname_destination}"
    type = "CNAME"
    ttl = 300
}

resource "cloudflare_record" "skyconqueror_cname_email" {
    domain = "${var.cloudflare_domain}"
    name = "email.${var.cloudflare_domain}"
    value = "${var.cloudflare_mx_destination}"
    type = "CNAME"
    ttl = 300
}

resource "cloudflare_record" "skyconqueror_mx_a" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mxa.${var.cloudflare_mx_destination}"
    type = "MX"
    ttl = 300
    priority = 10
}

resource "cloudflare_record" "skyconqueror_mx_b" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "mxb.${var.cloudflare_mx_destination}"
    type = "MX"
    ttl = 300
    priority = 10
}

resource "cloudflare_record" "skyconqueror_txt" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "v=spf1 include:${var.cloudflare_mx_destination} ~all"
    type = "TXT"
    ttl = 300
}

resource "cloudflare_record" "skyconqueror_txt_pic" {
    domain = "${var.cloudflare_domain}"
    name = "pic._domainkey.${var.cloudflare_domain}"
    value = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8k8kKqLdoT4RhzOx9CKuVga2fgEkTwlkwCyWFFk/F7zK4xNnuQWDg3wy4Q6swhyYfrDsf0o9BwDjagy2+4v97o0cjr3Q5vleCcaP93ZOOdHMLR7GaRMBTPJ2Iift3YAnjhdIkpYCdav1VPuWEzEv+SqELvFLL8U/nd+jDr8wrDwIDAQAB"
    type = "TXT"
    ttl = 300
}
