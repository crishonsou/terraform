locals {
  template_vars = {
    s3_bucket_iam_key_id  = module.web_app_bucket.access_key_id,
    s3_bucket_iam_key_sec = module.web_app_bucket.secret_access_key,
    s3_bucket_region      = var.region,
    s3_bucket_name        = var.bucket_name
  }

  helm_chart_values = templatefile(
    "${path.module}/values.yaml.tpl",
    local.template_vars
  )
}
