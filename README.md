# Big Query-Terraform
Terraform for GCP Bigquery. This repo contains how to create the datasets, tables and tables using partitioning and for-each for creating more than one repo.

## Try it out

1. Initialize your new Terraform configuration by running the terraform init command in the same directory as your main.tf file:

    ```sh
    terraform init
    ```
1. See the execution plan by running the terraform plan command with var-file, var-file is the inputs of the variables:

    ```sh
    terraform plan -var-file=var.tfvars 
    ```
    The output has a + next to resources blocks(google_bigquery_dataset & google_bigquery_table) , meaning that Terraform will 
    create these resources. Beneath that, it shows the attributes that will be set. When the value displayed is (known after 
    apply), it means that the value won't be known until the resource is created.

    If anything in the plan seems incorrect or dangerous, it is shows the error messages.

1. Apply you configuration now by running the command terraform apply:

    ```sh
    terraform apply plans.tfplan
    ```

1. After deploying, it will print the names of the dataset and table.

    ```sh
    Outputs:
    dataset_id = "test_dataset_id"
    table = "table1"
    ```

1. Clean up after you’re done:

    ```sh
    terraform destroy -var-file=var.tfvars 
    ```

----

This is not an official project and does not come with maintenance guarantees.
