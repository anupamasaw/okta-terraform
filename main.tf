### Provider Block ###

provider "okta" {
  org_name  = "dev-448827"
  base_url  = "okta.com"
  api_token =  var.okta_api_token
}

### Group Block ###
resource "okta_group" "new" {
 name        = var.okta_group_name
 description = var.okta_group_description
}

