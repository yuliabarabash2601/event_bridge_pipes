resource "log_group_name" "all_events" {
  name = "all_events"
}

resource "aws_cloudwatch_log_stream" "all_events" {
    name           = "/aws/events/all_events"
    log_group_name = log_group_name.all_events.name
}