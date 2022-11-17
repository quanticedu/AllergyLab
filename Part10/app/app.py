from flask import Flask, render_template, request
from dbconnect import connection
import os
import redis

""" Build Flask App"""
app = Flask(__name__)

@app.route("/")
def success():
    c, conn = connection()

    query = "SELECT * FROM foods"
    c.execute(query)

    data = c.fetchall()

    conn.close()

    return render_template("food_data.html", data=data)

@app.route("/submit", methods=['POST'])
def index():
    c, conn = connection()
    query = "SELECT NAME FROM foods where ID = " + request.form['button_identifier']
    c.execute(query)
    data = c.fetchall()
    conn.close()

    r = redis.Redis(host='redis-server', port=6379, db=0)
    r.publish('food_info', data[0][0])
    return "Order Submitted!"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 3006))
    app.run(debug=True, host='0.0.0.0', port=port)
