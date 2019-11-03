# kinesis-test
test kinesis with localstack

## Prerequisites

This prototype has been tested on Mac machines and requires [homebrew](https://brew.sh/) and [Dokcer](https://docs.docker.com/docker-for-mac/install/)

### python

We used Python 3.7.4 for this exercise. In order to setup the default version for console we used `pipenv` as explained [here](https://opensource.com/article/19/5/python-3-default-mac)

### localstack

We used `pip` to install Localstack, more information [here](https://github.com/localstack/localstack#installing)
To start locakstack as a docker container, we used the command suggested [here](https://github.com/localstack/localstack#running-in-docker)

## Usage

The Localstack configuration relies on Terraform. In order to push the configuration, follow the procedure below
```
cd terraform
terraform init
terraform plan
terraform apply
```

In order to push data to the Kinesis stream, it is necessary to run the `kinesis_producer.py` script with the following command (from the repository root)
```
python kinesis_producer.py
```

To verify the data incoming to the s3 bucket, use the following command
```
aws s3 --endpoint "http://localhost:4572" ls s3://luca-firehose-bucket --recursive
```
