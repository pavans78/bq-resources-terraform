########## COMMON INPUTS ############
main = {
  project = "my-first-project"
  region  = "us-central1"
  zone    = "us-central1-a"
  env     = "dev"
}

## Bigquery Dataset###
bigquery_dataset = {
  dataset_id                 = "test_dataset"
  dataset_description        = "Dataset used for basic template creation"
  delete_contents_on_destroy = false
}

## Bigquery table ##
table = {
  dataset_id          = "test_dataset"
  table_id            = "table1"
  description         = "BQ Table used for example source"
  deletion_protection = false
  schema              = "../src/schemas/bq_schema1.json"
  /* schema is taken from the table: bigquery-public-data.worldpop.population_grid_1km */
}


## Bigquery table with for-each and partitioning table ##
table-pf = {
  bq_table1 = {
    dataset_id               = "test_dataset"
    table_id                 = "table-pf1"
    description              = "BQ Table with partitioning"
    deletion_protection      = false
    schema                   = "../src/schemas/bq_schema1.json"
    partitioning_field       = "last_updated"
    partitioning_type        = "DAY"
  }
  bq_table1 = {
    dataset_id               = "test_dataset"
    table_id                 = "table-pf2"
    description              = "BQ Table with partitioning"
    deletion_protection      = false
    schema                   = "../src/schemas/bq_schema1.json"
    partitioning_field       = "last_updated"
    partitioning_type        = "YEAR"
  }
}
