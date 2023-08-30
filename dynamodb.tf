
module "dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name                        = "event-bridge-example"
  hash_key                    = "event_id"

  attributes = [
    {
      name = "event_id"
      type = "N"
    },
    {
      name = "message"
      type = "S"
    }
  ]
}