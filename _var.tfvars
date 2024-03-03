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

##### BQ Scheduled Queries #####
scheduled_queries = {
  name = "bq-schedued-query"
  query_path = "../src/scheduledqueries/schedued-query.sql"
  dataset_id = "test_dataset_id"
}

##### Service account #####
service_account = {
  account_id   = "sa-bq-scheduled-query"
  display_name = "Service Account for scheduled queries"
}

sa_roles = {
  project_roles = ["roles/bigquery.admin", "roles/bigquery.jobUser"]
  prefix        = "serviceAccount"
}

##### BQ views #####
view = {
  dataset_id  = "test_dataset_id"
  table_id    = "my1"
  description = "BQ Table used for example source"
  query       = "SELECT country_name, geo_id, population, longitude_centroid, latitude_centroid, alpha_3_code, last_updated FROM firm-shuttle-413014.test_dataset_id.table1 WHERE DATE(last_updated) >= '2020-05-12' LIMIT 10"
}
