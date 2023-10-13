variable "amis" {
    type = map(string)

    default = {
        img_us_east_1 = "ami-053b0d53c279acc90" 
        img_us_east_2 = "ami-036f5574583e16426"
    }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "bucket_name" {
  default = "s3-repo-webapp"
}

variable "env" {
  default = "Developer"
}

variable "key_name" {
    default = "terraform-aws-key"
}

variable "cdirs_acesso_remoto" {
    type = list(string)
    default = [ var.ip ]
}