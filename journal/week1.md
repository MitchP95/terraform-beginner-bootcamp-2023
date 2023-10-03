# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

The root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # all content with the exception of the following
├── variables.tf            # stores sturcture of input vars
├── terraform.tfvars        # data of variables to load into the terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
