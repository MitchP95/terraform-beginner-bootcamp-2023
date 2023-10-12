terraform {
    required_providers {
      terratowns = {
        source = "local.providers/local/terratowns"
        version = "1.0.0"
      }
    }

    cloud {
        organization = "mpuersten-bootcamp"

        workspaces {
            name = "terra-house-mp"
        }
    }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
    source = "./modules/terrahouse_aws"
    user_uuid = var.teacherseat_user_uuid
    index_html_filepath = var.index_html_filepath
    error_html_filepath = var.error_html_filepath
    content_version = var.content_version
    assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "NASA's Upcoming Artemis Mission"
  description = <<DESCRIPTION
NASA is currently preparing for the Artemis mission, which is preparation to put 
livable infrastructure on the moon. The Gateway station will orbit the moon and
act as a launch station for future space missions. Learn more here.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}

resource "terratowns_home" "home" {
  name = "Practicing good Cyber Security"
  description = <<DESCRIPTION
NASA is currently preparing for the Artemis mission, which is preparation to put 
livable infrastructure on the moon. The Gateway station will orbit the moon and
act as a launch station for future space missions. Learn more here.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}