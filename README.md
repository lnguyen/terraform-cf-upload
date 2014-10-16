# terraform-cf-upload

The goal of this repo is to automate cloud foundry community build to s3 using docker and digital ocean.

## Usage

```
mkdir terraform-cf-upload
cd terraform-cf-upload
terraform apply github.com/longnguyen11288/terraform-cf-upload
```

If repo is cloned. Just `mv terraform.tfvars.example terraform.tfvars` and edit variables and run `make`. This shall create and run workload and destroy image
