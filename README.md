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

Project runs in Ubuntu 22.04

[Check OS version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

## Shebang

Is leveraged in scripts to inform the OS which script interpreter to use while evaluating the script.

[Shebang Details](https://bash.cyberciti.biz/guide/Shebang)

## File Permissions

Linux file permissions and details on using Chmod can be found [here](https://linuxize.com/post/chmod-command-in-linux/)
