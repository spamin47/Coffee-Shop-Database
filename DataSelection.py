import DBManager
import pandas as pd

#MySQL terminal password
password = "1e9ee14d"
user = "b514d772424d00"
hostname = "us-cdbr-east-06.cleardb.net"
connection  = DBManager.create_server_connection(hostname,user,password)
#Connect database
db = "heroku_72ec536ef27fac4"#Database name
db_connection = DBManager.create_db_connection(hostname,user,password,db_name=db)

#Select from Customers
select_query = """
select * from product_inventory;
;
"""

results = DBManager.read_query(db_connection,select_query)

for result in results:
    print(result)
    
# from_db = []

# for result in results:
#     result = list(result)
#     from_db.append(result)
# columns = ["customer_id","customer_name","email"]

# df = pd.DataFrame(from_db,columns=columns)
# print(df)