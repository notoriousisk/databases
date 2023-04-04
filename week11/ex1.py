from pymongo import MongoClient


client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

db = client['db']
collection_name = db['restaurants']

def f1():
    cursor = collection_name.find({"cuisine": "Irish"})
    for row in cursor:
        print(row)
    return cursor

def f2():
    cursor = collection_name.find({"$or":[{"cuisine": "Irish"},{"cuisine": "Russian"}]})
    for row in cursor:
        print(row)
    return cursor

def f3():
    cursor = collection_name.find({"$and":[{"address.zipcode": "11215"}, {"address.street": "Prospect Park West"}, {"address.building": "284"}]})
    for row in cursor:
        print(row)
    return cursor

