resource "aws_kinesis_stream" "luca_stream" {
  name             = "luca-terraform-kinesis"
  shard_count      = 1
  retention_period = 48

#  shard_level_metrics = [
#    "IncomingBytes",
#    "OutgoingBytes",
#  ]

  tags = {
    Environment = "test"
  }
}
