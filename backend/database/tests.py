from django.test import TestCase
import requests

universal_id = "de2ffffcdqw"
universal_travel_id = "fwerfq431441"
travel_password = "wdeqef"
domain = '127.0.0.1:8000'


def testGetTokenApi():
    auth_resp = requests.post(f"http://{domain}/auth/get-token/", json={"universal_id": universal_id, "universal_travel_id": universal_travel_id, "travel_password": travel_password })
    if auth_resp.status_code == 200:
        testProtectedApi1(auth_resp=auth_resp)
        print(auth_resp.json()['token'])
    else:
        print(auth_resp.json())


def testProtectedApi1(auth_resp):
    headers = {
        "Authorization": f"Token {auth_resp.json()['token']}"
    }
    resp = requests.get(f"http://{domain}/auth/account/{universal_id}", headers=headers)
    print(resp.json())

testGetTokenApi()



# {
#     "universal_id": "de2ffffcdqw",
#     "universal_travel_id": "fwerfq431441",
#     "travel_password": "wdeqef",
#     "name": "John Doe",
#     "date_of_birth": "1990-08-19"
# }
#
# {
#     "universal_id": "de2ffffcdqw",
#     "universal_travel_id": "fwerfq431441",
#     "travel_password": "wdeqef"
# }

