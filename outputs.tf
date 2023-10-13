output "bucket_name" {
    description = "Bucket name for statically hosted website"
    value = module.home_nasa_hosting.bucket_name
}

output "s3_website_endpoint" {
    description = "S3 static website hosting endpoint"
    value = module.home_nasa_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "CloudFront distribution domain name"
  value = module.home_nasa_hosting.domain_name
}