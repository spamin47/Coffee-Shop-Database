import mysql.connector
from mysql.connector import Error
import pandas as pd

def create_server_connection(host_name, user_name, user_password):
    connection = None
    try:
        connection = mysql.connector.connect(
            host = host_name,
            user = user_name,
            passwd = user_password
        )
        print("Database connection successful")
    except Error as err:
        print(f"Error: '{err}'")
    return connection



#Create mysql database
def create_database(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Database created successfully")
    except Error as err:
        print(f"Error: '{err}'")



#Connect to database
def create_db_connection(host_name,user_name,user_password,db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host = host_name,
            user = user_name,
            passwd = user_password,
            database = db_name
        )
        print("MySQL database connection successful")
    except Error as err:
        print(f"Error:'{err}'")
    return connection

#Execute sql query
def execute_query(connection,query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit() #commit current transaction
        print("Query successfully executed")
    except Error as err:
        print(f"Error: '{err}'")

#Execute sql queries
def execute_queries(connection,query):
    cursor = connection.cursor()
    try:
        results = cursor.execute(query,multi=True)
        for result in results:
            print(result.statement)
        connection.commit() #commit current transaction
        print("Query successfully executed")
    except Error as err:
        print(f"Error: '{err}'")

#Execute select queries
def read_query(connection,query:str):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall() #return all the results in the table
        return result
    except Error as err:
        print(f"Error: '{err}'")