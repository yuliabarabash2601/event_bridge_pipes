
module "dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name                        = "event-bridge-example"
  hash_key                    = "event_id"
  stream_view_type           = "NEW_AND_OLD_IMAGES"
  stream_enabled              = true

  attributes = [
    {
      name = "event_id"
      type = "N"
    }
  ]
}