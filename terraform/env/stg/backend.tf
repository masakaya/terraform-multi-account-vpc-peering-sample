terraform {
  backend "s3" {
    bucket  = "masakaya-tfstate-stg"
    region  = "ap-northeast-1"
    profile = "masakaya-stg"
    key     = "terraform.tfstate"
    encrypt = true
  }
}