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

## Terraform and Input Variables

### Terraform Cloud Variables

There are two different variable types in terraform:
- Environment Variables - similar to terminal variables, can be used for cloud credentials
- Terraform Variables - variables you would typically set in a tfvars file, directly relating to your terraform structures

Both can be set in terraform cloud, with varying sensitivity settings to prevent leaking credentials.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

The purpose of the var flag is to set values for your input variables on the command line.

```sh
terraform apply -var "variable_name=value"
```

- You can use multiple -var flags in a single command to set multiple variables.
- If the same variable is assigned multiple times, the last value takes precedence.

```sh
terraform apply -var "region=us-west-1" -var "instance_type=t2.micro"
```

### var-file flag

The purpose of the var-file flag is to provide a file that contains values for multiple variables.

```sh
terraform apply -var-file="path/to/file.tfvars"
```

- The file should contain key-value pairs for variables.
- It's especially helpful when you have a lot of variables or if you want to maintain different sets of values in separate files for different environments or stages.
- If you have multiple -var-file flags, and if they set overlapping variables, the last one takes precedence.

```sh
region = "us-west-1"
instance_type = "t2.large"
```

```sh
terraform apply -var-file="prod.tfvars"
```

### terraform.tfvars

The default file to load in terraform variables in bulk

### auto.tfvars

The purpose of auto.tfvars is to automatically loaded variable definition files.

- If a file is named terraform.tfvars or any variation of *.auto.tfvars, it will be automatically loaded by Terraform.
- You do not need to explicitly use the -var-file flag to load them.
- They're used to separate environment-specific variable definitions from the main configuration.
- Files named terraform.tfvars have the highest precedence. If any variable is set in both terraform.tfvars and an *.auto.tfvars file, the value in terraform.tfvars will take precedence.

### order of terraform variables

The order in which Terraform loads variable values is important, especially if you have overlapping definitions:

- Environment variables: Variables set as environment variables with the TF_VAR_name format.
- The terraform.tfvars file: If present in the current directory.
- The *.auto.tfvars files: If present, loaded in lexicographic order.
- Var-files specified on command-line: -var-file flags, in the order they're provided.
- Individual var flags: -var flags on the command line, in the order they appear.

Each level has a higher precedence than the previous one. This means if the same variable is defined in multiple places, the last value loaded based on the order mentioned above will take precedence.


## Dealing with Config Drift

### Loss of state file

Losing the state file means you likely need to tear down cloud infrastructure manually.

You can use the `terraform port` command but this may not work for all cloud resources. This will be indicated in terraform provider documentation.

### Fixing missing resources with Terraform import

You can leverage this command to pull resource states back to the tfstate file. This works so far with S3 buckets:

```sh
terraform import aws_s3_bucket.bucket bucket-name
```

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix manual configuration

`terraform plan` can be leveraged to return infrastructure back to the expected state if the infrastructure has been modified manually via the console or cli.

## Fix using Terraform refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

Modules should be placed in a `modules` directory when doing local Terraform development, but the name can vary.

### Passing inp

Best practice is to pass input variables to modules.
The module must declar terraform variables in it's associated variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Module Sources

Using the source we can import modules from:
- local environment
- github
- Terraform registry

[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)


## Considerations for using ChatGPT with Terraform

Since LLMs are not trained on the most frequent releases they can produce errors or outdated items when generating terraform code. Documentation released from terraform and other cloud providers directly will always be more correct.

## Files in Terraform

### Fileexists function

A function native to terraform that can check whether a file exists or not.

```tf
condition = fileexists(var.index_html_filepath)
```

[fileexists](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Filemd5

Can be used to generate an 'etag', which is essentially a hash of a file to help indicate changes in file content. Without an etag terraform will not update files when the infrastructure has not changed.

[Filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable

Terraform has a built in `path` variable that allows referencing of local paths.

- path.module: allows you the get a path for the current module
- path.root: allows you to get the path for the root module

[Special Path Variable]((https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info))

Example:
```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}
```

## Tags

### Deleteing Tags 

To delete locally use `git tag -d <TAG_NAM>`

To delete remotely use `git push --delete origin <TAG_NAME>`

## Terraform Locals

### Terraform Data Sources

Enabled the user to leverage source data located in cloud resources. This allows the user to reference their cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources Documentation](https://developer.hashicorp.com/terraform/language/data-sources)

## Using JSON

This can be used to create a json policy, which can be used with AWS, inline in HCL.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

## Resource Lifecycle

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform Data

This assists with generating side-effects to plan against. 'Plain Values' don't typically produce these side effects, so the injection of a content version or similar value can assist. This allows us to upload our html files only if the content version has changed.

[Terraform Data](https://developer.hashicorp.com/terraform/language/resources/terraform-data)