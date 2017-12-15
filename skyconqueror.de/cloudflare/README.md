skyconqueror.de cloudflare configuration
===

Contains the terraform configuration rules for CNAME, MX, TXT for cloudflare.

**Note: due to a possible bug in terraform state refresh for the cloudplare provider
we need to remove all terraform state when applying changes.**
