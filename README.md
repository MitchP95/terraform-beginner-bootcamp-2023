# Terraform Beginner Bootcamp 2023

## Semantic Versioning
This project uses the following semantic version: X.Y.Z, where:
- X is a major version number marking major releases
- Y is a minor version number marking changes that are backwards compatible
- Z is small fixes and patches

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

- List with env command, filter with grep:
```sh
env | grep VAR
```

- Set with 
```sh
export VAR='value'
```

- Unset with
```sh
unset VAR
```

- Set variables for scripts with:

```sh
VAR='value' ./bin/script
```

- Set without export in bash script:

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

### AWS Credentials

AWS credentials listed in the .env.example file are **required** to run portions of the project, and should be set as part o the environment setup, or as needed depending on use cases.