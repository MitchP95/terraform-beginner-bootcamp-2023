output "bucket_name" {
    description = "Bucket name for statically hosted website"
    value = module.terrahouse_aws.bucket_name
}