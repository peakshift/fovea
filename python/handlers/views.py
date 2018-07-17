import json
import common.validate as validation
from flask import jsonify, request, Flask

app = Flask(__name__)
validate = validation.Validate()


@app.route('/projects', methods=["POST"])
def post():
    request_data = request.get_json()

    # if validate.check(request_data) == False:
    #     return jsonify({"msg": "Project not created."}), 400
    # else:
    #     return jsonify({"msg": "Project created."}), 201

    try:
        if validate.isvalid(request_data) == True:
            return jsonify({"msg": "Project created."}), 201
    except Exception as e:
        return jsonify("e"), 400


