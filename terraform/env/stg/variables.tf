variable "project_name" {
  default = "multi-account-vpc-peering-sample-stg"
}

variable "profile" {
  default = "masakaya-stg"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tags" {
  default = {
    terraform = "true"
    env = "stg"
    product = "multi-account-vpc-peering-sample"
  }
}
