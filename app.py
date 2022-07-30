from flask import Flask, request
import json
import uuid
import mysql.connector

app = Flask(__name__)
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="test"
)
mycursor = mydb.cursor(dictionary=True)


@app.route("/")
@app.route("/books", methods=["GET"])
def get_books():
    dict = []
    mycursor.execute("SELECT Name, Price, Author, ReferenceId FROM books")
    myresult = mycursor.fetchall()
    res = {"data": myresult}
    return res, 200


@app.route("/books", methods=["POST","PUT","DELETE"])
def manage_books():
    if request.method == 'POST':
        body = request.get_json()
        uid = uuid.uuid4()
        body['referenceId'] = uid.hex
        sql = "INSERT INTO books (Name, Price, Author, ReferenceId) VALUES (%s, %s, %s, %s)"
        val = (body['name'], body['price'], body['author'], body['referenceId'])
        mycursor.execute(sql, val)
        mydb.commit()
        if mycursor.rowcount > 0:
            res = {"message": "Insert data success"}
            return res, 200
        else:
            res = {"message": "No data insert"}
            return res, 500

    elif request.method == 'PUT':
        body = request.get_json()
        sql = "UPDATE books SET Name = %s, Price = %s, Author = %s WHERE ReferenceId = %s"
        val = (body['name'], body['price'], body['author'], body['referenceId'])
        mycursor.execute(sql, val)
        mydb.commit()
        if mycursor.rowcount > 0:
            res = {"message": "Update data success"}
            return res, 200
        else:
            res = {"message": "No data update"}
            return res, 400

    elif request.method == 'DELETE':
        refid = request.args.get('referenceId')
        sql = "DELETE FROM books WHERE ReferenceId = %s"
        val = (refid, )
        mycursor.execute(sql, val)
        mydb.commit()
        if mycursor.rowcount > 0:
            res = {"message": "Delete data success"}
            return res, 200
        else: 
            res = {"message": "No data delete"}
            return res, 400


if __name__ == '__main__':
    app.run(debug=True)