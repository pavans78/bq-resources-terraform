# View creation and configuration
resource "google_bigquery_table" "view" {
  dataset_id          = var.view.dataset_id
  table_id            = var.view.table_id
  description         = var.view.description
  deletion_protection = var.view.deletion_protection
  view {
    query = var.view.query
    #"SELECT country_name, geo_id, population, longitude_centroid, latitude_centroid, alpha_3_code, last_updated FROM firm-shuttle-413014.test_dataset_id.table1 WHERE DATE(last_updated) >= '2020-05-12' LIMIT 10"
    use_legacy_sql = false
  }
  labels = {
    env = var.main.env
  }
}
