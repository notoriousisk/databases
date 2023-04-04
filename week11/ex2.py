from pymongo import MongoClient


client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

db = client['db']
collection_name = db['restaurants']

def func():
    result = collection_name.insert_one({"address": {"street": "Sportivnaya", "zipcode": "420500", "building": "126", "address.coord": [-73.9557413, 40.7720266]},
                                         "borough": "Innopolis",
                                         "cuisine": "Serbian",
                                         "name": "The Best Restaurant",
                                         "restaurant_id": "41712354",
                                         "grades": {"grade": "A", "score": 11, "date": "2023-04-04T00:00:00.000+00:00"}
                                         })
    
    print(result)
    
func()