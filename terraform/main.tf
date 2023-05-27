
resource "aws_instance" "app" {
  count         = var.create_ec2 ? 1 : 0
  ami           = "ami-0715c1897453cabd1"
  instance_type = var.instance_type

  tags = local.common_tags
}

resource "aws_instance" "web" {
  count         = var.create_ec2 ? 1 : 0
  ami           = "ami-053b0d53c279acc90 "
  instance_type = var.instance_type

  tags = local.common_tags
}

locals {
  instance_ids = concat([aws_instance.app.*.id], [aws_instance.web.*.id])
}

resource "aws_instance" "example" {
  # count = terraform.workspace == "default" ? 1 : 2

  ami           = "ami-0715c1897453cabd1"
  instance_type = var.instance_type

  provisioner "local-exec" {
    command = "echo 'Destroy-time provisioner'"
  }

  # triggers = {
  #   always_run = timestamp()
  # }

  tags = merge(local.common_tags, local.myworkspace)
}
