import boto3
import json
from datetime import datetime
import calendar
import random
import time

my_stream_name = 'python-stream'

kinesis_client = boto3.client('kinesis', endpoint_url='http://localhost:4568', region_name='us-east-1')

def put_to_stream(thing_id, property_value, property_timestamp):
    payload = {
                'prop': str(property_value),
                'timestamp': str(property_timestamp),
                'thing_id': thing_id
              }

    print(payload)

    put_response = kinesis_client.put_record(
                        StreamName="luca-terraform-kinesis",
                        Data=json.dumps(payload),
                        PartitionKey=thing_id)

while True:
    property_value = random.randint(40, 120)
    property_timestamp = calendar.timegm(datetime.utcnow().timetuple())
    thing_id = 'aa-bb'

    put_to_stream(thing_id, property_value, property_timestamp)

    # wait for 5 second
    time.sleep(5)
