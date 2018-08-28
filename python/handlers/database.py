import time
from tinydb import TinyDB


class Database:
    def __init__(self):
        self.db = TinyDB('./db.json')
        self.time = time.time()

    def insert(self, collection: str, data: dict):
        data.update({"created": self.time, "updated": self.time})
        try:
            id: int = self.db.table(collection).insert(data)
            return id
        except:
            return None

    def get(self, collection: str):
        try:
            projects: list = self.db.table(collection).all()
            return projects
        except:
            return None

    def getbyid(self, collection: str, id: int):
        try:
            project: dict = self.db.table(collection).get(doc_id=id)
            return project
        except:
            return None

    def update(self, collection: str, data: dict, id: int):
        data["updated"] = self.time
        try:
            self.db.table(collection).update(data, doc_ids=[id])
            return True
        except:
            return False

    def delete(self, collection: str, id: int):
        try:
            self.db.table(collection).remove(doc_ids=[id])
            return True
        except:
            return False

