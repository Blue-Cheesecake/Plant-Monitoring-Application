from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime


PRIVATE_KEY_FILE_NAME = "plant-monitoring-7517f-firebase-adminsdk-2b5mq-9888786668.json"
PRIVATE_KEY_PATH = f"{os.getcwd()}/{PRIVATE_KEY_FILE_NAME}"

app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*",
            "methods": ["GET", "POST", "PUT", "DELETE"]}})

cred = credentials.Certificate(PRIVATE_KEY_PATH)
firebase_admin.initialize_app(cred)
db = firestore.client()


@app.route('/send_data', methods=['POST'])
def send_data():
    if request.is_json:
        data = request.get_json()
        document_id = data.get("device_id")
        new_data = data.get("new_data")

        print(new_data)

        if document_id and new_data:
            doc_ref = db.collection('devices').document(document_id)
            doc = doc_ref.get()

            if doc.exists:

                timestamp_str = new_data.get("detectedAt")
                t_int = int(timestamp_str)
                timestamp_str = datetime.fromtimestamp(t_int)
                new_data['detectedAt'] = timestamp_str

                existing_data = doc.to_dict().get('data', [])
                existing_data.append(new_data)
                doc_ref.update({"data": existing_data})
                return jsonify({"success": True, "message": "Data has been added to Firestore"}), 200
            else:
                return jsonify({"success": False, "message": "Document not found"}), 404

        else:
            return jsonify({"success": False, "message": "Document ID and new data are required"}), 400
    else:
        return jsonify({"success": False, "message": "Request payload must be JSON"}), 400


# for testing
@app.route('/')
def test():
    device_ref = db.collection(u"devices").document(u"gtr398")
    doc = device_ref.get()
    print(doc)

    if doc.exists:
        print(doc.to_dict())
        return doc.to_dict()
    return "No document"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
