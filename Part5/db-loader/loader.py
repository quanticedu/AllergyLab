import os
from dbconnect import connection
import csv
import glob
import time

folder_path = os.environ['FOLDER_PATH']

for attempt in range(5, 0, -1):
    try:
        c, conn = connection()
        print("connected")
        break
    except Exception as e:
        print(f"failed to connect due to {type(e)}, {attempt} retries left")
        time.sleep(5)

while True:
    try:
        # Find all the CSV files in a directory and loop through them
        csv_files = glob.glob(os.path.join(folder_path, '*.csv'))
        for filename in csv_files:
            print("Found File: ", filename)
            # Open the CSV file and read the data
            with open(filename, mode ='r')as file:
                csv_data = csv.reader(file)
                # For each row of CSV data, prepare a SQL INSERT statement
                for row in csv_data:
                    query = f"INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha_gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES ({row[0]},{row[1]},{row[2]},{row[3]},{row[4]},{row[5]},{row[6]},{row[7]},{row[8]},{row[9]},{row[10]})"
                    print(query)
                    # Insert the data into the database
                    try:
                        print("Updating Database")
                        c.execute(query)
                        conn.commit()
                    # 'Catch' any exceptions
                    except Exception as e:
                        print("Database Update Error: ", e)
                        conn.rollback()
            # Remove the file once complete
            print("Complete - Removing File: ", filename)
            os.remove(filename)
    except Exception as e:
        print(f"ERROR: {e}")
    # Sleep for 5 seconds
    time.sleep(5)

conn.close()