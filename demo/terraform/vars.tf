variable "instance_type" {
  description = "Instance type"
  default = {
    dev   = "t3.small"
    stage = "t3.small"
    prod  = "t3.medium"
  }
}
