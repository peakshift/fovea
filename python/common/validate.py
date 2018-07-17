from jsonschema import validate


class Validate:
    def __init__(self):
        self.schema = {
            "id": "/projects",
            "title": "Projects",
            "type": "object",
            "properties": {
                "name": {
                    "type": "string"
                },
                "status": {
                    "enum": [0, 1, 2]

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

    def check(self, data):
        try:
            """Is valid if None is returned"""
            validate(data, self.schema)
            return True
        except:
            return False

    def isvalid(self, data):
        try:
            """Is valid if None is returned"""
            validate(data, self.schema)
            return True
        except Exception as e:
            msg = [word for word in str(e).split('\n')]
            print(msg[0])
            return e
