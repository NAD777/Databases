import psycopg2
from faker import Faker
from geopy.geocoders import Nominatim
con = psycopg2.connect(database="dvdrental", user="postgres",
                       password="12345", host="127.0.0.1", port="5432")

cur = con.cursor()
cur.callproc('get_addresses_with_11')
res = cur.fetchall()

geolocator = Nominatim(user_agent="lab")

for address_id, city, address in res:
    try:
        location = geolocator.geocode(f'{address}')
        lat, lon = (location.latitude, location.longitude)
    except BaseException:
        lat, lon = 0, 0
    cur.execute("UPDATE address SET latitude = %s, longitude = %s WHERE address_id = %s", (lat, lon, address_id))
    print(address_id, '|',  address, (lat, lon))
con.commit()
cur.close()
con.close()
