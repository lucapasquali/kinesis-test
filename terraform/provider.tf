provider "aws" {
  # ... potentially other provider configuration ...

  endpoints {
    kinesis  = "http://localhost:4568"
    firehose = "http://localhost:4572"
    s3       = "http://localhost:4572"
  }
}
