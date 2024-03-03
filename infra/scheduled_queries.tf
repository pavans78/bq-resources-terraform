resource "google_bigquery_data_transfer_config" "scheduled_queries" {
  display_name         = var.scheduled_queries.name
  service_account_name = google_service_account.service_account.email
  location             = var.main.region
  data_source_id       = "scheduled_query"
  schedule             = "every 6 hours"
  params = {
    query = templatefile("${var.scheduled_queries.query_path}", { project_id = var.main.project, dataset_id = var.scheduled_queries.dataset_id })
  }
  schedule_options {
    disable_auto_scheduling = false
  }

  depends_on = [google_project_iam_member.sa_iam_roles]
}
