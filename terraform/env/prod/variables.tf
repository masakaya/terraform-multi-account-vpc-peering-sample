variable "project_name" {
  default = "multi-account-vpc-peering-sample-prod"
}

variable "profile" {
  default = "masakaya-prod"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tags" {
  default = {
    env = "prod"
    product = "multi-account-vpc-peering-sample-prod"
  }
}
