from flask import Flask, request, jsonify
from database import get_db_connection
from models import create_table
from flask_cors import CORS

app= Flask(__name__)
CORS(app) #enabling CORS for all routes

@app.route('/users', methods=['GET'])
def get_all_users():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * from users")
    users = cursor.fetchall()
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify(users), 200

@app.route('/users', methods=['POST'])
def add_user():
    data = request.json
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (name,email) values (%s,%s)",
                   (data['name'],data['email']))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"message":"User created successfully"}), 201

@app.route('/createtable')
def test():
    create_table()
    return jsonify({"message":"Table created successfully"}), 200