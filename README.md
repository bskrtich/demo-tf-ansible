# demo-tf-ansible

This project is a demo terraform ansible combo.

This has 2 distinct parts.
1. Infrastructure (Managed by Terraform)
1. Setup (Managed by ansible)

## Terraform

Terraform allows you to create infrastructure using a common language for any cloud/local provider. Most resources can be managed this way allowing for easy creation using reusable code and also allows for disaster recovery.

## Ansible

Ansible allows you to setup applications, services, environments in an easy reproducible way.

## Notes

In this example I use a Makefile to combine commands from both ansible and terraform, which has the added benefit of helping self document the code. Try running `make help` while in the demo folder in this repo to see available commands. Be aware this code is not complete and isn't intended to run on its own.
