module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  bus_name = "eventbridge-producer"

  rules = {
    all_events = {
      description   = "Capture all events"
      event_pattern = jsonencode({ "source" : ["Pipe ${local.pipe_name}"] })
      enabled       = true
    }
    targets = {
      all_events = {
        name = "send-events-to-logs"
        arn = aws_cloudwatch_log_stream.all_events.arn
      }
    }
  }
}