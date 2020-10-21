resource "aws_instance" "demo" {
  tags = {
    Name        = "(${terraform.workspace}) Demo"
    Application = "demo"
    Environment = terraform.workspace
    Terraform   = "true"
  }

  availability_zone       = "${data.aws_region.current.name}a"
  disable_api_termination = (terraform.workspace == "prod" ? true : false)
  ebs_optimized           = true
  iam_instance_profile    = "GeneralEC2ServerRole"
  instance_type           = var.instance_type[terraform.workspace]
  key_name                = "devops"
  monitoring              = true
  subnet_id               = data.terraform_remote_state.vpc.outputs.private_subnets_ids[0]
  private_ip              = cidrhost(data.terraform_remote_state.vpc.outputs.private_subnets_cidr_blocks[0], 12)

  ami = data.aws_ami.ubuntu.id
  lifecycle {
    ignore_changes = [ami]
  }

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.private_ssh_id, # 22
    aws_security_group.demo_sg.id # 7419-7420
  ]

  user_data = templatefile("userdata.tpl", {
    hostname = "${terraform.workspace}-demo"
  })

  credit_specification {
    cpu_credits = "unlimited"
  }

  root_block_device {
    volume_size = 50
  }
}
