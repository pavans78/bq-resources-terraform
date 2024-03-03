resource "google_bigquery_table" "view" {
  dataset_id  = var.view.dataset_id
  table_id    = var.view.table_id
  description = var.view.description
  view {
    query = var.view.query
    use_legacy_sql = false
  }
  labels = {
    env = var.main.env
  }
}
