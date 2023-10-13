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

module "home_nasa_hosting" {
    source = "./modules/terrahome_aws"
    user_uuid = var.teacherseat_user_uuid
    public_path = var.nasa.public_path
    content_version = var.nasa.content_version
}

resource "terratowns_home" "home" {
  name = "NASA's Upcoming Artemis Mission"
  description = <<DESCRIPTION
NASA is currently preparing for the Artemis mission, which is preparation to put 
livable infrastructure on the moon. The Gateway station will orbit the moon and
act as a launch station for future space missions. Learn more here.
DESCRIPTION
  domain_name = module.home_nasa_hosting.domain_name
  town = "the-nomad-pad"
  content_version = var.nasa.content_version
}

module "home_cybersecurity_hosting" {
    source = "./modules/terrahome_aws"
    user_uuid = var.teacherseat_user_uuid
    public_path = var.cybersecurity.public_path
    content_version = var.cybersecurity.content_version
}


resource "terratowns_home" "home_cybersecurity" {
  name = "Practicing good Cyber Security"
  description = <<DESCRIPTION
Delve into the core practices that bolster digital safety in our connected world. 
This article highlights vital strategies, beyond just strong passwords, to ensure 
you're protected against evolving cyber threats. Stay a step ahead of hackers and 
secure your digital footprint.
DESCRIPTION
  domain_name = module.home_cybersecurity_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.cybersecurity.content_version
}