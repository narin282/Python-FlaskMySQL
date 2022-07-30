import mysql.connector
import json

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="test"
)

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM books")
myresult = mycursor.fetchall()

dict = []
for x in myresult:
    book = {
        "id": x[0],
        "Name": x[1],
        "Price": x[2],
        "Author": x[3]
    }
    dict.append(book)

json_object = json.dumps(dict, indent = 4) 
print(json_object)

