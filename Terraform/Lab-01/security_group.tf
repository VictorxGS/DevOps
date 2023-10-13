resource "aws_security_group" "ssh_access_us_east_1" {
    provider = aws.Virginia
    name = "ssh_access_us_east_1"
    description = "Acesso ssh"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cdirs_acesso_remoto
    }

    tags = {
    Name = "ssh"
    }
}

resource "aws_security_group" "ssh_access_us_east_2" {
    provider = aws.Ohio
    name = "ssh_access_us_east_2"
    description = "Acesso ssh"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cdirs_acesso_remoto
    }

    tags = {
    Name = "ssh"
    }
}