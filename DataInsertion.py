import DBManager

#MySQL terminal password
password = "4725"
user = "root"
#DB properties
db = "Coffee_shop" #Database name
db_connection = DBManager.create_db_connection("localhost",user,password,db_name=db)

#insert query for Customers
insert_query = """
insert into Customers(name,email) values
("Tim","Timmy@gmail.com"),
("Minh Nguyen","minhnguyen@gmail.com"),
("Jake","JakeSeoul@gmail.com"),
("Jahan","Janefasdfas@gmail.com"),
("Bobby","Bobby3@gmail.com"),
("Tom","tommy1234@gmail.com"),
("Johnny","JohnnyN@gmail.com"),
("Eric vong","Evong@gmail.com")
;
"""
#insert query for Recipe
insert_query = """
insert into Recipe(Recipe_name,Recipe_description) values
("Espresso","Ratio: 1 shot of espresso, Cup: 2-4 oz. Espresso Cup"),
("Double Espresso","Ratio: 2 shots of espresso, Cup: 3-4 oz. Demitasse Cup"),
("Red Eye","Ratio: 1 shot of espresso + 6 oz. of drip-brewed coffee, Cup: 8 oz. Coffee Mug"),
("Americano","Ratio: 1 shot of espresso + 3 oz. of hot water, Cup: 5-6 oz. Glass Coffee Mug"),
("Macchiato","Ratio: 1 shot of espresso + 1 to 2 teaspoons of steamed milk, Cup: 3 oz. Glass Espresso Cup"),
("Cappuccino","Ratio: 1-2 shots of espresso + 2 oz. of steamed milk + 2 oz. of foamed milk + sprinkling of chocolate powder (optional), Cup: 6-8 oz. Cappuccino Mug"),
("Cafe Latte","Ratio: 1 shot of espresso + 8-10 oz. of steamed milk + 1 cm of foam, Cup: 6-9 oz. Coffee Mug"),
("Mocha","Ratio: 1 shot of espresso + 1-2 oz. of chocolate syrup/powder + 1-3 oz. of steamed milk + 2-3 cm of foam or whipped cream, Cup: 6-8 oz. Irish Coffee Mug"),
("Iced Coffee","Ratio: 2 oz. drip coffee or espresso + 4 oz. of ice + 4-6 oz of milk or water + flavoring syrup to taste, Cup: 14 oz. Mixing Glass");

"""

#insert query for Schedule
insert_query = """
insert into Schedule(Description) values
("Wed 9am-5pm, Thur 9am-5pm"),
("Mon 9am-5pm, Tues 9am-5pm"),
("Fri 9am-5pm, Sat 9am-5pm"),
("Wed 9am-1pm, Thur 9am-1pm"),
("Mon 9am-1pm, Tues 9am-1pm"),
("Fri 9am-1pm, Sat 9am-5pm"),
("Wed 1pm-5pm, Thur 1pm-5pm"),
("Mon 1pm-5pm, Tues 1pm-5pm"),
("Fri 1pm-5pm, Sat 1pm-5pm");
"""
#insert query for Supplier
insert_query = """
insert into Supplier(Supplier_name,Contact_name,Address,Email,Phone) values
("CoffeePowderInc","Josh Love","1241 Cooler Dr. San Jose CA","JosssshM@gmail.com","4083242645"),
("Costco","Joshua Ho","1241 Coolest Dr. San Jose CA","JosssssdfsfashM@gmail.com","4082242345"),
("CupCompany","Cupper Co","1241 Coolio Dr. San Jose CA","Cupman@gmail.com","4082242785"),
("Beverage Toxic","Joshy Cok","1241 Coooolest Dr. San Jose CA","JossM@gmail.com","4081112345");
"""

#insert query for Product
insert_query = """
insert into Product(Product_name,Product_description,Price,Availability,Recipe_id) values
("Double Espresso","A double espresso may also be listed as doppio, which is the Italian word for double. This drink is highly concentrated and strong.",
5.00,True,2),
("Red Eye","The red eye's purpose is to add a boost of caffeine to your standard cup of coffee.",
6.00,True,3),
("Americano","Soldiers would add water to their coffee to extend their rations farther. The water dilutes the espresso while still maintaining a high level of caffeine.",
7.00,True,4),
("Macchiato","Flavoring syrups are often added to the drink according to customer preference.",
8.00,True,5),
("Cappuccino","This creamy coffee drink is usually consumed at breakfast time in Italy and is loved in the United States as well. Thick foam layer and additional flavorings that can be added to it.",
5.00,True,6),
("Cafe Latte","Cafe lattes are considered an introductory coffee drink since the acidity and bitterness of coffee are cut by the amount of milk in the beverage.",
4.50,True,7),
("Mocha"," The chocolate powder or syrup gives it a rich and creamy flavor and cuts the acidity of the espresso.",
3.10,True,8),
("Iced Coffee","Often, different flavoring syrups will be added per the preference of the customer. You can even top it off with some cold foam.",
2.50,True,9)
;
"""
#insert query for Ingredients
insert_query = """
insert into Ingredients(Ingredient_name,Unit_price) values
("coffee bean bag",1.50),
("coffee creamer",0.01),
("Whipped cream",1.00),
("espresso shot", 1.00),
("cocoa powder bag", 2.00),
("whole milk (gal)", 2.00),
("2% milk/gal (gal)", 2.00),
("low fat milk (gal)", 2.00),
("chocolate box", 3.00),
("sugar packet",0.01);
"""

#insert query for Staff
insert_query = """
insert into Staff(Schedule_id,First_name,Last_name,Email,Phone,Job_title) values
(1,"Kevin","Chad","k873492@gmail.com","4085447779","Employee"),
(2,"Dan","Le","dandog@gmail.com","4085469779","Employee"),
(3,"Kog","Big","bbdacog@gmail.com","4090469779","Janitor"),
(3,"Holly","Steward","whiteffdsa@gmail.com","4080468889","Cashier"),
(1,"Mary","Garcia","dfadsmexdkjaf@gmail.com","4090400079","Manager"),
(2,"Heather","Big","bbdacog@gmail.com","4090469779","Janitor"),
(3,"Showee","Small","bshawdee@gmail.com","4080469999","Barista")
"""

#insert query for inventory
insert_query = """
insert into inventory(Location,Quantity,Product_id) values
("ShelfA",10,1),
("ShelfB",10,50),
("ShelfC",5,51),
("FridgeA",4,52),
("FridgeB",5,53),
("FridgeC",6,54),
("FridgeA",7,55),
("FridgeA",2,56)
"""

#inesrt query for orders
insert_query = """
insert into Orders(Order_date,Total_price,Quantity,Payment_method,Customer_id,Product_id) values
("2022-10-20",8,2,"cash",2,1),
("2022-10-21",4,2,"apple pay",1,51),
("2022-11-22",9,2,"card",3,51),
("2022-10-21",8,2,"cash",4,1),
("2022-12-19",10,2,"apple pay",5,56),
("2022-11-21",8,2,"card",6,54),
("2022-10-23",5,2,"cash",2,1),
("2022-10-22",8,2,"cash",1,53),
("2022-01-21",11,2,"card",3,55)
"""

DBManager.execute_query(db_connection,insert_query)