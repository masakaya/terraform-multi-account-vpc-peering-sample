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
    env = "stg"
    stguct = "multi-account-vpc-peering-sample-stg"
  }
}
