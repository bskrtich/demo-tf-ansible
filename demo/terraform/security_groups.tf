resource "aws_security_group" "demo_sg" {
  name = "${terraform.workspace}-demo-sg"
  tags = {
    Application = "demo"
    Environment = terraform.workspace
    Terraform   = "true"
  }

  description = "Allow Demo traffic from the private network to this instance"
  vpc_id      = data.terraform_remote_state.vpc.outputs.id

  ingress {
    description = "Demo Service Port (Private Network Only)"
    from_port   = 7419
    to_port     = 7419
    protocol    = "tcp"
    cidr_blocks = data.terraform_remote_state.vpc.outputs.private_subnets_cidr_blocks
  }

  ingress {
    description = "Demo UI Port (Public Network Only)"
    from_port   = 7420
    to_port     = 7420
    protocol    = "tcp"
    cidr_blocks = data.terraform_remote_state.vpc.outputs.public_subnets_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
