terraform {
  backend "s3" {
    bucket = "terraform-state-docker-ecs"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}