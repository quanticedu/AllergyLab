from flask import Flask, render_template
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
    r = redis.Redis(host='redis-server', port=6379, db=0)
    r.publish('food_info', 'New Order 17171717171')
    return "Order Submitted!"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 3006))
    app.run(debug=True, host='0.0.0.0', port=port)
