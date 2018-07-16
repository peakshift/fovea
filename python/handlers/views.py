import common.validate as validation
from flask import jsonify, request, Flask

app = Flask(__name__)
validate = validation.Validate()


@app.route('/projects', methods=["POST"])
def post():
    return jsonify({"msg": "Project created."}), 201


