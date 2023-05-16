import DBManager

#MySQL terminal password
password = "1e9ee14d"
user = "b514d772424d00"
hostname = "us-cdbr-east-06.cleardb.net"
connection  = DBManager.create_server_connection(hostname,user,password)
#Connect database
db = "heroku_72ec536ef27fac4"#Database name

db_connection = DBManager.create_db_connection(hostname,user,password,db_name=db)

#Create view for staff with schedule
staff_schedule_view_query = """
drop view if exists Staff_schedule;
CREATE view Staff_schedule as
select staff.First_name, staff.Last_name, schedule.description
from staff
inner join schedule
on schedule.schedule_id = staff.schedule_id
;
"""
DBManager.execute_queries(db_connection,staff_schedule_view_query)

#Create view for Order_history
order_history_view_query = """
drop view if exists Order_history;
create view Order_history as
select orders.Order_date, product.Product_name
from orders
inner join product
on product.Product_id=orders.Product_id
order by orders.Order_date DESC
"""
DBManager.execute_queries(db_connection,order_history_view_query)

#Create view for Product_inventory
product_inventory_view_query = """
drop view if exists Product_inventory;
create view Product_inventory as
select product.Product_name, inventory.Location, inventory.Quantity
from product
inner join inventory
on product.Product_id=inventory.Product_id
"""
DBManager.execute_queries(db_connection,product_inventory_view_query)

#Create view for Product_recipe
product_recipe_view_query = """
drop view if exists Product_recipe;
create view Product_recipe as
select product.Product_name, recipe.Recipe_description
from product
inner join recipe
on product.recipe_id = recipe.Recipe_id
"""
DBManager.execute_queries(db_connection,product_recipe_view_query)
