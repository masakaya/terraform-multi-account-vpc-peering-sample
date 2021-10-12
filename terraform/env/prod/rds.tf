module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.4.0"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.31"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  name     = "demodb"
  username = "user"
  password = "adminuser"
  port     = "3306"

  # ランダムでパスワードを作りたい時
  #create_random_password = true
  #random_password_length = 12

  family = "mysql5.7"

  multi_az               = false
  subnet_ids             = module.vpc.database_subnets
  major_engine_version = "5.7"

  vpc_security_group_ids = [ module.security_group.security_group_id ]

  # 削除OK、スナップショット取らない
  deletion_protection = false
  skip_final_snapshot = true

  apply_immediately=true

  tags = var.tags
}




