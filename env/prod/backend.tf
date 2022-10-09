terraform {
  backend "s3" {
    bucket = "terraform-state-docker-eks"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}