module "vpc" {
  # see. https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
  source = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "${var.project_name}-vpc"

  cidr = "172.18.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["172.18.96.0/19", "172.18.128.0/19", "172.18.160.0/19"]
  public_subnets  = ["172.18.0.0/19", "172.18.32.0/19", "172.18.64.0/19"]

  # 検証用のためNAT G/Wは一つ設定してルーティングさせる( EIPも自動生成する )
  enable_nat_gateway = true
  single_nat_gateway  = true
  tags = var.tags
}