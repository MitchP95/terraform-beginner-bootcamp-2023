resource "random_string" "bucket_name" {
    length  = 32
    lower = true
    upper = false
    special = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
    # S3 bucket naming rules
    # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
    bucket = random_string.bucket_name.result

    tags = {
        UserUuid = var.user_uuid
    }
}
