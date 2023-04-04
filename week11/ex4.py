from pymongo import MongoClient
import datetime


client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

db = client['db']
collection_name = db['restaurants']

def get_restaurants():
    cursor = collection_name.find({"address.street": "Prospect Park West"})
    for row in cursor:
        counter = 0
        for grades in row['grades']:
            if grades['grade'] == 'A':
                counter += 1
        if counter > 1:
            collection_name.delete_one({"_id": row["_id"]})
        else: 
            collection_name.update_one({"_id": row["_id"]}, {"$push": {"grades": {"date": datetime.datetime.now(), "grade": "A", "score": 11}}})

get_restaurants()