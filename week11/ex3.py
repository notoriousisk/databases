from pymongo import MongoClient


client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

db = client['db']
collection_name = db['restaurants']

def f1():
    result = collection_name.delete_one({"borough": "Brooklyn"})
    
def f2():
    result = collection_name.delete_many({"cuisine": "Thai"})
    
