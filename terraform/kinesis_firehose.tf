resource "aws_kinesis_firehose_delivery_stream" "test_stream" {
  name        = "terraform-kinesis-firehose-test-stream"
  destination = "s3"

  s3_configuration {
    role_arn   = "${aws_iam_role.firehose_role.arn}"
    bucket_arn = "${aws_s3_bucket.luca_bucket.arn}"
  }

  kinesis_source_configuration {
    kinesis_stream_arn = "${aws_kinesis_stream.luca_stream.arn}"
    role_arn           = "${aws_iam_role.kinesis_iam.arn}"
  }
}

resource "aws_s3_bucket" "luca_bucket" {
  bucket = "luca-firehose-bucket"
  acl    = "private"
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "kinesis_iam" {
  name = "kinesis_iam"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "firehose:DeleteDeliveryStream",
          "firehose:PutRecord",
          "firehose:PutRecordBatch",
          "firehose:UpdateDestination"
        ],
        "Resource": [
          "${aws_kinesis_stream.luca_stream.arn}"
        ]
      }
    ]
}
EOF
}
