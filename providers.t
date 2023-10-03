terraform {
    # cloud {
    #     organization = "mpuersten-bootcamp"

    #     workspaces {
    #         name = "terra-house-mp"
    #     }
    # }
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.18.1"
        }
        random = {
            source = "hashicorp/random"
            version = "3.5.1"
        }
    }
}

provider "aws" {
  # Configuration options
  # Access keys load automatically from environment
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs
provider "random" {
    #Configuration options
}
