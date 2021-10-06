terraform {
  backend "s3" {
    bucket  = "masakaya-tfstate-prod"
    region  = "ap-northeast-1"
    profile = "masakaya-prod"
    key     = "terraform.tfstate"
    encrypt = true
  }
}