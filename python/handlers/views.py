import json
import common.validate as validation
from flask import jsonify, request, Flask

app = Flask(__name__)
validate = validation.Validate()


@app.route('/projects', methods=["POST"])
def post():
    request_data = request.get_json()

    message = validate.isvalid(request_data)
    print(message)
    if message is True:
        return jsonify({"msg": "Project created."}), 201
    else:
        return jsonify(message), 400



