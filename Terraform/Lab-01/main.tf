provider "aws" {
  alias = "Virginia"
  region = "us-east-1"
}

provider "aws" {
  alias = "Ohio"
  region = "us-east-2"
}

// Provisionamento de instâncias de EC2
resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["img_us_east_1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev.maq-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh_access_us_east_1.id}"]
}

resource "aws_instance" "dev4" {
  ami = var.amis["img_us_east_1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev.maq-4"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh_access_us_east_1.id}"]
  depends_on = [aws_s3_bucket.hdbatata]
} 

resource "aws_instance" "dev5" {
  ami = var.amis["img_us_east_1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev.maq-5"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh_access_us_east_1.id}"]
} 

resource "aws_instance" "dev6" {
  provider = aws.Ohio
  ami = var.amis["img_us_east_2"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev.maq-5"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh_access_us_east_2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-hml]
} 

resource "aws_instance" "dev7" {
  provider = aws.Ohio
  ami = var.amis["img_us_east_2"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev.maq-7"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh_access_us_east_2.id}"]
} 

resource "aws_s3_bucket" "s3-repo-webapp" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
    Environment = var.env
  }
}

resource "aws_dynamodb_table" "dynamodb-dev" {
  provider = aws.Ohio
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

