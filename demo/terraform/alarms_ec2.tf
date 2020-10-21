resource "aws_cloudwatch_metric_alarm" "demo_ec2_cpu" {
  alarm_name        = "(${terraform.workspace}) Demo CPU"
  alarm_description = "Managed by Terraform"

  count               = terraform.workspace == "prod" ? 1 : 0
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "3"
  evaluation_periods  = "5"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  dimensions = {
    "InstanceId" = aws_instance.demo.id
  }
  period    = "60"
  statistic = "Average"
  threshold = "75"

  alarm_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  ok_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "demo_ec2_memoryused" {
  alarm_name        = "(${terraform.workspace}) Demo Memory Used"
  alarm_description = "Managed by Terraform"

  count               = terraform.workspace == "prod" ? 1 : 0
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "3"
  evaluation_periods  = "5"
  namespace           = "CWAgent"
  metric_name         = "MEM_USED_PERCENT"
  dimensions = {
    "InstanceId" = aws_instance.demo.id
  }
  period    = "60"
  statistic = "Average"
  threshold = "75"

  alarm_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  ok_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "demo_ec2_diskused" {
  alarm_name        = "(${terraform.workspace}) Demo Disk Used"
  alarm_description = "Managed by Terraform"

  count               = terraform.workspace == "prod" ? 1 : 0
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "3"
  evaluation_periods  = "5"
  namespace           = "CWAgent"
  metric_name         = "DISK_USED_PERCENT"
  dimensions = {
    "InstanceId" = aws_instance.demo.id
  }
  period    = "60"
  statistic = "Average"
  threshold = "75"

  alarm_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  ok_actions = [
    data.terraform_remote_state.sns.outputs.alert_high_arn,
  ]
  insufficient_data_actions = []
}
