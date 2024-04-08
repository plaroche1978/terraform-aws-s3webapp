
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  region = "us-west-2"
  prefix = "test"
  name   = "bucket"
}

run "bucket_creation" {
  assert {
    condition     = aws_s3_bucket.bucket.bucket_prefix == "test-bucket"
    error_message = "Bucket prefix does not match expected value"
  }

  assert {
    condition     = aws_s3_bucket.bucket.force_destroy == true
    error_message = "Bucket should be set to force destroy"
  }
}

run "bucket_public_access_block" {
  assert {
    condition     = aws_s3_bucket_public_access_block.bucket.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.bucket.block_public_acls == false
    error_message = "Public ACLs should not be blocked"
  }
}

run "bucket_ownership_controls" {
  assert {
    condition     = aws_s3_bucket_ownership_controls.bucket.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.bucket.rule.object_ownership == "BucketOwnerPreferred"
    error_message = "Object ownership does not match expected value"
  }
}

run "bucket_website_configuration" {
  assert {
    condition     = aws_s3_bucket_website_configuration.bucket.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }

  assert {
    condition     = aws_s3_bucket_website_configuration.bucket.index_document.suffix == "index.html"
    error_message = "Index document suffix does not match expected value"
  }
}

run "bucket_acl" {
  assert {
    condition     = aws_s3_bucket_acl.bucket.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }

  assert {
    condition     = aws_s3_bucket_acl.bucket.acl == "public-read"
    error_message = "ACL does not match expected value"
  }
}

run "bucket_policy" {
  assert {
    condition     = aws_s3_bucket_policy.policy.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }
}

run "webapp_object" {
  assert {
    condition     = aws_s3_object.webapp.bucket == aws_s3_bucket.bucket.id
    error_message = "Bucket ID does not match expected value"
  }

  assert {
    condition     = aws_s3_object.webapp.key == "index.html"
    error_message = "Object key does not match expected value"
  }
}

run "output_endpoint" {
  assert {
    condition     = output.endpoint == aws_s3_bucket_website_configuration.bucket.website_endpoint
    error_message = "Output endpoint does not match expected value"
  }
}