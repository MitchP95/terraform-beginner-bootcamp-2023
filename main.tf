terraform {
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

resource "random_string" "bucket_name" {
    length  = 16
    lower = true
    upper = false
    special = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
    # S3 bucket naming rules
    # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
    bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}
