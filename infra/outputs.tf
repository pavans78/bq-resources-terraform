output "dataset_id" {
  value       = google_bigquery_dataset.bigquery_dataset.dataset_id
  description = "Dataset name"
}

output "table" {
  value       = google_bigquery_table.table.table_id
  description = "table name"
}

output "table-pf1" {
  value       = google_bigquery_table.table-pf[table-pf1].table_id
  description = "table name for partitionin table"
}

output "table-pf2" {
  value       = google_bigquery_table.table-pf[table-pf2].table_id
  description = "table name for partitionin table"
}
