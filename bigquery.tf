# dataset creation and configuration
resource "google_bigquery_dataset" "bigquery_dataset" {
  dataset_id                 = var.bigquery_dataset.dataset_id
  description                = var.bigquery_dataset.dataset_description
  project                    = var.main.project
  location                   = var.main.region
  delete_contents_on_destroy = var.bigquery_dataset.delete_contents_on_destroy
  labels = {
    env = var.main.env
  }
}

# table creation and configuration without partitioning
resource "google_bigquery_table" "table" {
  dataset_id          = var.table.dataset_id
  table_id            = var.table.table_id
  description         = var.table.description
  deletion_protection = var.table.deletion_protection
  project             = var.main.project
  schema              = file("${var.table.schema}")

  labels = {
    env = var.main.env
  }

  depends_on = [
    google_bigquery_dataset.bigquery_dataset
  ]
}


### table creation using for-each condition with partitioning field###
resource "google_bigquery_table" "table-pf" {
  for_each            = var.table-pf
  dataset_id          = each.value.dataset_id
  table_id            = each.value.table_id
  description         = each.value.description
  deletion_protection = each.value.deletion_protection
  project             = var.main.project
  schema              = file("${each.value.schema}")
  time_partitioning {
    field                    = each.value.partitioning_field
    type                     = each.value.partitioning_type
  }

  labels = {
    env = var.main.env
  }

  depends_on = [
    google_bigquery_dataset.bigquery_dataset
  ]
}




