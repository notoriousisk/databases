import psycopg2
from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut, GeocoderUnavailable

con = psycopg2.connect(database="dvdrental", user="postgres",
                       password="lokki224", host="127.0.0.1", port="5432")
print("Database opened successfully")


cur = con.cursor()
cur.execute('''SELECT * FROM address''')
rows = cur.fetchall()
addresses = []
for row in rows:
    address = row[1]
    address_id = row[0]
    addresses.append((address_id, address))
print("Address added successfully")

cur.execute('''ALTER TABLE address 
ADD COLUMN IF NOT EXISTS longitude FLOAT; 
ALTER TABLE address 
ADD COLUMN IF NOT EXISTS latitude FLOAT;''')


geolocator = Nominatim(user_agent="dvd_rental")

coordinates = []
print(len(addresses))
k = 0
for address in addresses:
    try:
        location = geolocator.geocode(address[1])
        if location is not None:
            coordinates.append((address[0], location.longitude, location.latitude))
        else:
            coordinates.append((address[0], 0, 0))
        print(k)
        k += 1
    except (GeocoderTimedOut, GeocoderUnavailable):
        coordinates.append((address[0], 0, 0))
        print(k)
        k += 1
        
print("latitude and longtitude determined")

for coordinate in coordinates:
    query = "UPDATE address SET longitude = %s, latitude = %s WHERE address_id = %s"
    cur.execute(query, (coordinate[1], coordinate[2], coordinate[0]))
    print(query, (coordinate[1], coordinate[2], coordinate[0]))

con.commit()
con.close()
