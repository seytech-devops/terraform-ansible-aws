variable "create_ec2" {
  description = "Switch to control EC2 creation"
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "EC2 istance type"
  type        = string
  default     = "t3a.small"
}