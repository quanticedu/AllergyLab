import os
from dbconnect import connection
import csv
import glob
import time

folder_path = os.environ['FOLDER_PATH']
c, conn = connection()

while True:
    try:
        csv_files = glob.glob(os.path.join(folder_path, '*.csv'))
        for filename in csv_files:
            print("Found File: ", filename)
            with open(filename, mode ='r')as file:
                csv_data = csv.reader(file)
                for row in csv_data:
                    query = f"INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha_gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES ({row[0]},{row[1]},{row[2]},{row[3]},{row[4]},{row[5]},{row[6]},{row[7]},{row[8]},{row[9]},{row[10]})"
                    print(query)
                    try:
                        print("Updating Database")
                        c.execute(query)
                        conn.commit()
                    except Exception as e:
                        print("Database Update Error: ", e)
                        conn.rollback()
            print("Complete - Removing File: ", filename)
            os.remove(filename)
    except:
        print("ERROR:")
    time.sleep(5)

conn.close()