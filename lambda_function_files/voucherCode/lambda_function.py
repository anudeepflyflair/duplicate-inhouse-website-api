import json
import urllib.request
import base64
import os
from datetime import datetime, timedelta

def lambda_handler(event, context):
    # Define the URL for the API
    url = "https://flairair-api.intelisystraining.ca/RESTv1/vouchers/Generate?fields={fields}"

    # Define the expiry date (30 days from now)
    expiry_date = (datetime.utcnow() + timedelta(days=6)).isoformat() + "Z"

    # Construct the payload
    payload = {
        "voucherType": {
            "href": "/voucherTypes/a%C6%92Jj2ImKybdP8tQcem2rUrd3sa66LEFx%C2%A5BLJTdx9on4=",
            "key": os.environ['VOUCHER_KEY'],
            "name": "Late Arrival"
        },
        "generationNumber": 2,
        "password": None,
        "personalIdentificationNumber": None,
        "autoGeneratePersonalIdentificationNumber": {
            "length": 4
        },
        "autoGeneratePassword": {
            "length": 6
        },
        "expiryDate": expiry_date,
        "available": 20,
        "reason": "Sample reason for generating this voucher",
        "bookingWindow": "none",
        "voucherValue": 60,
        "eligiblePassengers": [
            {
                "firstName": "Alice",
                "lastName": "Smit",
                "pnr": "PNR123"
            },
            {
                "firstName": "Bob",
                "lastName": "Johnson",
                "pnr": "PNR456"
            }
        ]
    }

    # Create a request object
    req = urllib.request.Request(url, data=json.dumps(payload).encode('utf-8'), method='POST')
    req.add_header('Content-Type', 'application/json')

    # Add Basic Authentication
    username = os.environ['USERNAME']
    password = os.environ['PASSWORD']
    credentials = f"{username}:{password}"
    b64_credentials = base64.b64encode(credentials.encode()).decode()
    req.add_header('Authorization', f'Basic {b64_credentials}')

    try:
        # Make the API request
        with urllib.request.urlopen(req) as response:
            response_body = response.read()
            response_data = json.loads(response_body)
            return {
                'statusCode': 200,
                'body': response_data
            }
    except urllib.error.HTTPError as e:
        error_message = e.read().decode('utf-8')
        error_response = {"error": "An error occurred while processing your request.", "details": error_message}
        return {
            'statusCode': e.code,
            'body': error_response
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': str(e)
        }