# Terraform Beginner Bootcamp 2023

## Semantic Versioning

This project uses the following semantic version: X.Y.Z, where:

-   X is a major version number marking major releases
-   Y is a minor version number marking changes that are backwards compatible
-   Z is small fixes and patches

## Environment Setup

Gitpod was used for development of this project, all dependencies and terminals for relevant technololgies are installed and launched at runtime via the [.gitpod.yml](.gitpod.yml) file.

[How Gitpod is Configured](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Terraform

The Terraform CLI installation instructions changed prior to the bootcamp - the most updated instructions were pulled from here: [Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

The install script is called from [.gitpod.yml](.gitpod.yml) on environment launch, the install script can be found here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

## Linux Distribution

Project runs in Ubuntu 22.04 - [Check your OS version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

## Scripting

Scripting is used regularily in the project. Read sections below for guidance on contributions and development context.

### Shebang

Is leveraged in scripts to inform the OS which script interpreter to use while evaluating the script. [Shebang Details](https://bash.cyberciti.biz/guide/Shebang)

### File Permissions

Linux file permissions and details on using Chmod can be found [here](https://linuxize.com/post/chmod-command-in-linux/)

```sh
chmod u+x /bin/install_terraform_cli
```

### Utilization of Environment Variables

-   List with env command, filter with grep:

```sh
env | grep VAR
```

-   Set with

```sh
export VAR='value'
```

-   Unset with

```sh
unset VAR
```

-   Set variables for scripts with:

```sh
VAR='value' ./bin/script
```

-   Set without export in bash script:

```sh
#!/usr/bin/env bash

VAR='value'
```

### Printing and referencing

Print or reference using `$`, like `echo $VAR`

### Scope of Env Vars

Environment variables will not be available between separate terminals, the are scoped to the terminal they are assinged in unless set at a global scope.

### Env Vars in Gitpod

Setting env vars in gitpod will make the env var globally available each time the environment is launched.

```sh
gp env VAR='value'
```

### AWS CLI Installation

AWS CLI is installed to facilitate interactions with the cloud provider via: [./bin/install_aws_cli](./bin/install_aws_cli)

[Getting started with AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

Credentials can be checked with the following command:

```sh
aws sts get-caller-identity
```

The structure of the return will look something like this:

```
{
    "UserId": "AAAAAAAAAAAAAAAAAAAAA",
    "Account": "111111111111111",
    "Arn": "arn:aws:iam::1111111111111111:user/Username"
}
```

### AWS Credentials

AWS credentials listed in the .env.example file are **required** to run portions of the project, and should be set as part o the environment setup, or as needed depending on use cases.


## Terraform Basics

### Terraform Registry

Terraform sources their provider and modules from a terraform dedicaated registry located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** are interfaces to to cloud service providers and their APIs allowing terraform its flexibility
- **Modules** are exportable and leveragable blocks of modular terraform code that can be ported and shared

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)

### Terraform CLI

See all commands with `terraform`

### Initialization

At the start of a new terraform project you can run `terraform init` which will download the required binary files for the terraform providers used in the project.

### Terraform Plan

This command `terraform plan` will generate a changest about the infrastructure state to be modified.

You can output the change set to be passed to an apple, but this outputting is often ignored.

### Terraform Apply

`terraform apply`

This will run a plan and pass the generate changeset to be executed by terraform. Apply should prompt a yes or no from the user.

If you want to automatically approve an apply you can pass the auto approve flag: `terraform apply --auto-approve`

### Terraform Destroy

`terraform destroy`

This will destroy resources that have been deployed. The auto-approve flag also works on this command.

### Terraform Lockfiles

`.terraform.lock.hcl` contains the locked versioning for providers and modules that should be used with the project. The lockfile should be commited to the repo as typical for lockfiles to enforce consistence version control.

### State Files

`.terraform.tfstate` contains info about the current state of the infrastructure. This is a generated file and should be regenerated rather than being modified by hand. This file **should not** be tracked via git - it may contain sensitive data.

### Terraform Directory

`.terraform` directory ccontains binaries of terraform providers.

## AWS Resources

### S3 Buckets

Holds binary blobs and files. Can be created with the following structure in terraform: 

```sh
resource "aws_s3_bucket" "example" {
    bucket = "uniquename"
}
```

There are very specific [naming conventions for S3 buckets that should be followed.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)

## Troubleshooting

This section details various issues and troubleshooting workflows that were experienced during the bootcamp.

### Terraform cloud and Gitpod

The Terraform Login command `terraform login` command is blank, and counter intuitive. Since Gitpod blocks paste action it can be easy to make a mistake during this step, so you should ensure you allow pasting and paste with a right mosue click instead of keyboard shotcuts to avoid issues.

To acquire your access token after running `terraform login` you need to press `P` to 'print' the token, then access the webpage by holding Ctrl and clicking the link. 