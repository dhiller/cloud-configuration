#!/bin/bash
set -euo pipefail
set -o posix

function main {
  if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <terraform_command> [terraform_options...]"
    exit 1
  fi

  local cwd=$(pwd)

  local command="$1"; shift

  terraform "$command" \
    -var-file="$cwd/globals.tfvars" \
    -var-file="$cwd/variables.tfvars" \
    -var "cloudflare_token=$CLOUDFLARE_TOKEN" \
    -var "cloudflare_email=$CLOUDFLARE_EMAIL" \
    -var "mailgun_skyconqueror_api_key=$MAILGUN_SKYCONQUEROR_API_KEY" \
    -var "mailgun_skyconqueror_smtp_password=$MAILGUN_SKYCONQUEROR_SMTP_PASSWORD" \
    "$@"
}

main "$@"
