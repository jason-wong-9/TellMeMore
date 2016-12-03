from clarifai import rest
from clarifai.rest import ClarifaiApp
import secrets
import json
from clarifai.rest import Image as ClImage


app = ClarifaiApp(secrets.clientId, secrets.clientSecret)

#get general model
model = app.models.get('general-v1.3')

# predict with the model
data = model.predict_by_url(url='https://samples.clarifai.com/metro-north.jpg')

with open('data.json', 'w') as outfile:
	json.dump(data, outfile	)