from pymongo import MongoClient
from datetime import datetime

client = MongoClient("mongodb://localhost")

db = client['test']

# ex 1
def query_all_irish_cuisines():
    cursor = db.restaurants.find({"cuisine": "Irish"})
    for document in cursor:
        print(document)

def query_all_irish_and_russian_cuisines():
    cursor = db.restaurants.find({"$or": [{"cuisine": "Irish"}, {"cuisine": "Russian"}]})
    for document in cursor:
        print(document)

def findRestaurantByAddress(building, street, zipcode):
    cursor = db.restaurants.find({
        'address.building': building,
        'address.street': street,
        'address.zipcode': zipcode
    })
    for document in cursor:
        print(document)


findRestaurantByAddress('284', 'Prospect Park West', '11215')

# ex 2
def insert_new_res():
    result = db.restaurants.insert_one({'address.building': '126', 
                                        'address.coord': [-73.9557413, 40.7720266], 
                                        'address.zipcode': '420500',
                                        'borough': 'Innopolis',
                                        'cuisine': 'Serbian',
                                        'name': 'The Best Restaurant',
                                        'id': 41712354,
                                        'grades': [
                                                {
                                                    'date': datetime(2023, 4, 4),
                                                    'grade': 'A',
                                                    'score': 11
                                                }
                                            ]
                                        })
def find_innopolis():
    cursor = db.restaurants.find({"borough": "Innopolis"})
    for document in cursor:
        print(document)

# find_innopolis()

# ex 3
def delete_brooklyn_restaurant():
    result = db.restaurants.delete_one({'borough': 'Brooklyn'})


def delete_thai_cuisine():
    result = db.restaurants.delete_many({'cuisine': 'Thai'})
    print(f"Deleted {result.deleted_count} Thai restaurants")

# delete_brooklyn_restaurant() 

# ex4

def task4(): 
    cursor = db.restaurants.find({"address.street": "Prospect Park West"})
    for el in cursor:
        amount = 0
        for grade in el['grades']:
            if grade['grade'] == 'A':
               amount += 1
        if amount > 1:
            db.restaurants.delete_one({'_id': el['_id']})
        elif amount == 1:
            el['grades'].append({
                'date': {'$date': datetime(2023, 4, 4)},
                'grade': 'A', 
                'score': 111
                })
            db.restaurants.replace_one({'_id': el['_id']}, el)

task4()


