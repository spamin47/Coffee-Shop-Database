import DBManager

#MySQL terminal password
password = "4725"
user = "root"
connection  = DBManager.create_server_connection("localhost",user,password)

#Query for creating database
db = "Coffee_shop"#Database name
create_database_query = "Create database " + db
DBManager.create_database(connection,create_database_query)

db_connection = DBManager.create_db_connection("localhost",user,password,db_name=db)

#Drop tables if exist
drop_table_query = """
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Ingredients;
DROP TABLE IF EXISTS Recipe;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Schedule;
"""

create_table_query = """CREATE table Customers(
customer_id int not null auto_increment,
name varchar(20) not NULL,
email varchar(30) not null,
PRIMARY KEY (customer_id)
);

create table Recipe(
Recipe_id int not null auto_increment,
Recipe_name VARCHAR(30) not null,
Recipe_description VARCHAR(200),
PRIMARY KEY (Recipe_id)
);

create table Schedule(
Schedule_id int not null auto_increment,
Description varchar(30) not null,
primary key (Schedule_id)
);
create table Supplier(
Supplier_id int not null auto_increment,
Supplier_name varchar(20) not null,
Contact_name varchar(20) not null,
Address varchar(50) not null,
Email varchar(30) not null,
Phone varchar(12) not null,
primary key (Supplier_id)
);
create table Product(
Product_id int not null auto_increment,
Product_name varchar(20) not null,
Product_description varchar(200) not null,
Price double not null,
Availability bool not null,
Recipe_id int,
primary key (Product_id),
Foreign key (Recipe_id) REFERENCES Recipe(Recipe_id)
);
create table Ingredients(
Ingredient_id int not null auto_increment,
Ingredient_name varchar(20) not null,
Unit_price double not null,
primary key (ingredient_id)
);
create table Staff(
Staff_id int not null auto_increment,
Schedule_id int not null,
First_name varchar(10) not null,
Last_name varchar(10) not null,
Email varchar(30) not null,
Phone int not null,
Job_title varchar(10) not null,
primary key (Staff_id),
foreign key(Schedule_id) REFERENCES Schedule(Schedule_id)
);
create table inventory(
Inventory_id int not null auto_increment,
Location varchar(20) not null,
Quantity int not null,
Product_id int not null,
primary key (Inventory_id),
foreign key (Product_id) REFERENCES Product(Product_id)
);
create table Orders(
Order_id int not null auto_increment,
Order_date date not null,
Total_price double not null,
Quantity int not null,
Payment_method varchar(10) not null,
Customer_id int not null,
Product_id int not null,
PRIMARY key (Order_id),
foreign key (customer_id) REFERENCES Customers(customer_id),
foreign key (Product_id) REFERENCES Product(Product_id)
);"""

#Execute Queries
# DBManager.execute_queries(db_connection,drop_table_query)
# DBManager.execute_queries(db_connection,create_table_query)

# connection.close()


# #custom query
# query = """
# create table Supplier(
# Supplier_id int not null auto_increment,
# Supplier_name varchar(20) not null,
# Contact_name varchar(20) not null,
# Address varchar(50) not null,
# Email varchar(30) not null,
# Phone varchar(12) not null,
# primary key (Supplier_id)
# );
# """
# DBManager.execute_queries(db_connection,query)

# connection.close()