import mysql.connector

def connection():
    # Edited out actual values
    conn = mysql.connector.connect( host='dbhost',
                            port=3306,
                            database='allergen_info',
                            user='pythonapp',
                            password='secretPass123!')
    c = conn.cursor()

    return c, conn