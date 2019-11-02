provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "us-east-1"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    kinesis  = "http://localhost:4568"
    firehose = "http://localhost:4572"
    s3       = "http://localhost:4572"
  }
}
