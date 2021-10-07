locals {
  instance_type = "t2.micro"
}

# Get AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

# Create EC2 Instance
resource "aws_instance" "this" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = local.instance_type
  subnet_id     = module.vpc.public_subnets[0]
  user_data = file("./scripts/user_data.sh")
  iam_instance_profile = aws_iam_instance_profile.systems_manager.name
  tags = var.tags
}

# EC2にアタッチするインスタンスプロファイル、ロールの作成( SSM Session Managerでアクセスできるように設定 )
# Memo: assume_roleは Terraform module iam あったかとおもう一旦この状態で作成する
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_assume_role" {
  name               = "ec2_assume_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.ec2_assume_role.name
  policy_arn = data.aws_iam_policy.systems_manager.arn
}

resource "aws_iam_instance_profile" "systems_manager" {
  name = "SSMInstanceProfile"
  role = aws_iam_role.ec2_assume_role.name
}
