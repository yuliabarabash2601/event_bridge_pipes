
variable "aws_region" {
  type = string
  description = "AWS region to deploy to"
  default = "eu-west-1"
}

variable "aws_profile" {
  type = string
  description = "AWS profile to use"
  default = "nordcloud_admin_yuliia"
}