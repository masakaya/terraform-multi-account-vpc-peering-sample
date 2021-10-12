module "vpc" {
  # see. https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
  source = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "${var.project_name}-vpc"

  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["10.0.96.0/24", "10.0.128.0/24", "10.0.160.0/24"]
  public_subnets  = ["10.0.0.0/24", "10.0.32.0/24", "10.0.64.0/24"]

  # 検証用のためNAT G/Wは一つ設定してルーティングさせる( EIPも自動生成する )
  enable_nat_gateway = true
  single_nat_gateway  = true

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = var.tags
}