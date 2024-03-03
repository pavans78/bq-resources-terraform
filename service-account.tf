resource "google_service_account" "service_account" {
  project      = var.main.project
  account_id   = "${var.service_account.account_id}-${var.main.env}"
  display_name = var.service_account.display_name
}

resource "google_project_iam_member" "sa_iam_roles" {
  for_each = toset(var.sa_roles.project_roles)
  project  = var.main.project
  role     = each.key
  member   = "${var.sa_roles.prefix}:${google_service_account.service_account.email}"

  depends_on = [google_service_account.service_account]
}
