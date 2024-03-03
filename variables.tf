########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
    env     = string
  })
}

# variable for bq datataset #
variable "bigquery_dataset" {
  type = object({
    dataset_id                 = string
    dataset_description        = string
    delete_contents_on_destroy = bool
  })
}

# variable for bq table #
variable "table" {
  type = object({
    dataset_id          = string
    table_id            = string
    description         = string
    deletion_protection = bool
    schema              = string
  })
}

# variable for bq table with for each#
variable "table-pf" {
  type = map(object({
    dataset_id               = string
    table_id                 = string
    description              = string
    deletion_protection      = bool
    schema                   = string
    partitioning_field       = string
    partitioning_type        = string
  }))
}

##### SERVICE ACCOUNT VARIABLES #####
variable "service_account" {
  type = object({
    account_id   = string
    display_name = string
  })
}

##### SERVICE ACCOUNT ROLES #####
variable "sa_roles" {
  type = object({
    project_roles = list(string)
    prefix        = string
  })
}

##### BQ Scheduled Queries #####
variable "scheduled_queries" {
  type = object({
    name = string
    #sa_email   = string
    query_path = string
    dataset_id = string
  })
}

