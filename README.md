# Share Modules in the Private Registry

The companion repository for the [Learn tutorial](https://learn.hashicorp.com/tutorials/terraform/module-private-registry-share) on using the private registry in Terraform Cloud.

How to call this module to deploy our WebApp in AWS

```
module "s3webapp" {
  source  = "app.terraform.io/pascal-tfc-org/s3webapp/aws"
  version = "1.0.1"

  name = "namehere"
  prefix = "prefix"
  region = "aws-region"
}
```

Available region are `ca-central-1` and `us-east-1`.
Prefix need to be maximum 3 letters. 