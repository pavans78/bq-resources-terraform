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
