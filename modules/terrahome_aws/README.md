## Terrahome AWS

```tf
module "home_cybersecurity" {
    source = "./modules/terrahome_aws"
    user_uuid = var.teacherseat_user_uuid
    public_path = var.cybersecurity_public_path
    content_version = var.content_version
}
```

It's important to note the public directory expectations:
- index.html
- error.html
- assets