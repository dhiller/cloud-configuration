# Configure the Mailgun provider
provider "mailgun" {
    api_key = "${var.mailgun_dhiller_api_key}"
}

# Create a new domain
resource "mailgun_domain" "dhiller_default" {
    name          = "dhiller.de"
    spam_action   = "disabled"
    smtp_password = "${var.mailgun_dhiller_smtp_password}"
}
