import secrets
import json
import sys
from clarifai import rest
from clarifai.rest import ClarifaiApp
from clarifai.rest import Image as ClImage

_url = str(sys.argv[1])
app = ClarifaiApp(secrets.clientId, secrets.clientSecret)

#get general model
model = app.models.get('general-v1.3')

# predict with the model
data = model.predict_by_url(url=_url)
with open('data.json', 'w') as outfile:
	json.dump(data,  outfile, indent=4, sort_keys=True)