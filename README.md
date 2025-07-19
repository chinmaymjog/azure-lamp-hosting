# Terraform Deployment

This directory contains the [Terraform configuration](terraform/main.tf) for deploying the Azure infrastructure. It is split into several modules including the hub and web deployments.

## Directory Structure

- **main.tf**: The entry point that configures modules such as `hub`, `preprod-web`, and `prod-web`. See [main.tf](terraform/main.tf).
- **variables.tf**: Defines common and environment-specific variables. See [variables.tf](terraform/variables.tf).
- **outputs.tf**: Exports important output values such as resource group names, public IPs, and server details. See [outputs.tf](terraform/outputs.tf).
- **providers.tf**: Configures the required providers and features. See [providers.tf](terraform/providers.tf).
- **terraform.tfvars**: Contains variable overrides for your deployment. Update this file with your preferred values.
- **.env & .env-sample**: Environment files for local development.

Modules are stored in the [modules/](terraform/modules/) directory:

- **hub module**: Deploys common resources such as the Azure virtual network, bastion host, Key Vault, etc.
- **web module**: Deploys web servers, load balancers, MySQL flexible server, etc.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) (version 1.x or later)
- An active Azure subscription with the necessary permissions.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured. Log in to your Azure account:
  ```sh
  az login
  ```
- Ensure the following files are populated:
  - **terraform.tfvars**: Update values such as `ip_allow`, `p_short`, `l_short`, etc.
  - **.env**: Populate with environment-specific configuration if needed.

## Getting Started

1. **Initialize Terraform**

   Open a terminal in the `terraform` directory and run:

   ```sh
   terraform init
   ```

2. **Plan the Deployment**

   Generate an execution plan to preview the changes Terraform will make.

   ```sh
   terraform plan
   ```

3. **Apply the Configuration**

   Deploy the infrastructure to Azure. You will be prompted to confirm the action.

   ```sh
   terraform apply
   ```

   To apply without interactive approval (e.g., in a CI/CD pipeline), you can use:

   ```sh
   terraform apply -auto-approve
   ```

## Outputs

After a successful deployment, Terraform will display the output values defined in `outputs.tf`. These include important information like public IP addresses for the web environments, the Key Vault URI, and other resource details.

You can also view the outputs at any time by running:

```sh
terraform output
```

## Clean Up

To destroy all the resources created by this Terraform configuration, run the following command. You will be prompted for confirmation.

```sh
terraform destroy
```

**Warning:** This command will permanently delete all managed resources. Use with caution.
