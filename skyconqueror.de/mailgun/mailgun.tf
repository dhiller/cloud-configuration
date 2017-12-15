# Configure the Mailgun provider
provider "mailgun" {
    api_key = "${var.mailgun_skyconqueror_api_key}"
}

# Create a new domain
resource "mailgun_domain" "skyconqueror_default" {
    name          = "skyconqueror.de"
    spam_action   = "disabled"
    smtp_password = "${var.mailgun_skyconqueror_smtp_password}"
}