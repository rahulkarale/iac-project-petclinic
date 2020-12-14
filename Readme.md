# Guide

## Pre-requisites
1. Azure Account
2. Terraform Setup
3. Storage Account with a Blob container to store terraform state file.
4. AZ CLI

## Getting Started
1. Clone the repo to a local directory, say 'ProductCommonInfra'. Here onwards it will be refered as **\<root-dir\>**. 
2. Create Azure service princple
    ```sh
    az ad sp create-for-rbac --name <sp-name>
    ```
    > **Note:** Save/Keep its output with you.

3. Set Azure Providers
    Add below values to environment variables
    ```sh
    TF_VAR_tenant_id
    TF_VAR_client_id
    TF_VAR_client_secret
    TF_VAR_subscription_id
    ```
    ***OR***
    
    create a file terraform.tfvars alongside variable.tf and set the values for below variables.
    ```sh
    tenant_id           = ""
    client_id           = ""
    client_secret       = ""
    subscription_id     = ""
    ```
4. Get Terraform Modules with below command.
    ```sh
    terraform get -update
    ```
5. Initialize backend to store state file in Azure Blob Container.
    1. Using command line
        * Command Syntax
        ```sh
        terraform init -backend-config "storage_account_name=<storage-acc-name>" -backend-config "container_name=<container-name>" -backend-config "key=<tfstate-file-name>.tfstate" -backend-config "access_key=<storage-acc-access-key>"
        ```
        * Example 
        ```sh
        terraform init -backend-config "storage_account_name=tfbackendpetclinict" -backend-config "container_name=tfstate" -backend-config "key=petclinic.tfstate" -backend-config "access_key=dummy-accesss-key" 
        ```

    ***OR***

    2. Using use backend.tf for configuration and command *(Recommended for terrraform development purpose)*
        * File Content
        ```
        terraform {
            backend "azurerm" {
                storage_account_name = "<storage-acc-name>"
                container_name= "<container-name>" 
                key="<tfstate-file-name>.tfstate"
                access_key="<storage-acc-access-key>"
            }
        }
        ```
        * Command
        ```sh
        terraform init 
        ```

    > ***Note:*** *Use unique backend configuration for for every terraform project. If you are using same blob container for every project, make sure to have different \<tfstate-file-name\>s*

6. Plan your infrastructure. It will show you infrastructure changes (create, modify or delete), it will going to make.
    ```sh
    terraform plan 
    ```
7. Create your infrastructure. It will apply the changes shown in previous step.
    ```sh
    terraform apply -auto-approve
    ```
