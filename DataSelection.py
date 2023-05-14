import DBManager
import pandas as pd

#MySQL terminal password
password = "4725"
user = "root"
#DB properties
db = "Coffee_shop" #Database name
db_connection = DBManager.create_db_connection("localhost",user,password,db_name=db)

#Select from Customers
select_customer_query = """
select * from Customers;
"""

results = DBManager.read_query(db_connection,select_customer_query)
    
from_db = []

for result in results:
    result = list(result)
    from_db.append(result)
columns = ["customer_id","customer_name","email"]

df = pd.DataFrame(from_db,columns=columns)
print(df)