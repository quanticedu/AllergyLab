import mysql.connector
import os

db_name = os.environ['DB_NAME']
db_user = os.environ['DB_USER']
db_pass = os.environ['DB_PASS']

def connection():
    # Edited out actual values
    conn = mysql.connector.connect( host='dbhost',
                            port=3306,
                            database=db_name,
                            user=db_user,
                            password=db_pass)
    c = conn.cursor()

    return c, conn