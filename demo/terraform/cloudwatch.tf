resource "aws_cloudwatch_log_group" "demo" {
  name = "${terraform.workspace}-demo"
  tags = {
    Application = "demo"
    Environment = "${terraform.workspace}"
    Terraform   = "true"
  }
}
