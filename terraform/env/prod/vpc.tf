module "vpc" {
  # see. https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
  source = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "${var.project_name}-vpc"

  cidr = "172.18.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["172.18.11.0/24", "172.18.12.0/24", "172.18.13.0/24"]
  public_subnets  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
  # DBサブネットについては公式でもproductionでは非推奨となっているため注意
  database_subnets = ["172.18.21.0/24", "172.18.22.0/24", "172.18.23.0/24"]
  create_database_subnet_group = true

  # 検証用のためNAT G/Wは一つ設定してルーティングさせる( EIPも自動生成する )
  enable_nat_gateway = true
  single_nat_gateway  = true
  tags = var.tags
}