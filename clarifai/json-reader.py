import json
import operator
from pprint import pprint


with open('data.json') as data_file:    
    data = json.load(data_file)

array = data["outputs"][0]["data"]["concepts"]
_dict = {}
for i in array: 
	name = i['name']
	value = i['value']
	kv = [(name, value)]
	_dict.update(kv)

sorted_x = sorted(_dict.items(), key=operator.itemgetter(1), reverse=True)


with open('kv.json', 'wb') as outfile:
	json.dump(sorted_x, outfile, indent=4)
