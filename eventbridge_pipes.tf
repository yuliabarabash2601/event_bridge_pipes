resource "aws_iam_policy" "policy" {
  name   = "pipe-policy"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams",
          "events:PutEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "pipe_role" {
  name        = "pipe-role"
  description = "Role for pipe"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.pipe_role.name
  policy_arn = aws_iam_policy.policy.arn
}

locals {
  pipe_name = "example-pipe"
}

resource "aws_pipes_pipe" "example" {
  name       = local.pipe_name
  role_arn   = aws_iam_role.pipe_role.arn
  source     = module.dynamodb_table.dynamodb_table_stream_arn
  target     = module.eventbridge.eventbridge_bus_arn
  source_parameters {
    dynamodb_stream_parameters {
      batch_size        = 1
      starting_position = "LATEST"
    }
  }
}