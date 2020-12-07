module "web_app_bucket" {
  source = "github.com/crishonsou/s3-bucket"
  name   = var.bucket_name
}
