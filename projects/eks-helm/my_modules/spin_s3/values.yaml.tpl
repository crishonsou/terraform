minio:
  enabled: false
s3:
  enabled: true
  bucket: ${s3_bucket_name}
  region: ${s3_bucket_region}
  accessKey: ${s3_bucket_iam_key_id}
  secretKey: ${s3_bucket_iam_key_sec}
