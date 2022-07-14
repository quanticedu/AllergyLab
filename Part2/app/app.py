from flask import Flask, render_template
from dbconnect import connection
import os

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


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 3006))
    app.run(debug=True, host='0.0.0.0', port=port)
