from jsonschema import validate



class Validate:
	def __init__(self, data):
		self.schema = {
		    "id": "/projects",
		    "title": "Projects",
		    "type": "object",
		    "properties": {
		        "name": {
		            "type": "string"
		        },
		        "status": {
		            "enum": [ 0, 1, 2 ] 

		        },
		        "description": {
		            "type": "string"
		        },
		        "hours": {
		            "type": "number"
		        },
		        "client": {
		            "type": "string"
		        }
		    },
		    "required": ["name", "status", "hours", "description", "client"]
		}

'''
		try:
			assert validate(data, self.schema)
			return True
		except:
			return False
'''			

 