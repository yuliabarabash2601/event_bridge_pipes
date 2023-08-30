module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  bus_name = "eventbridge-producer"
}