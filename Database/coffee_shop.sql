CREATE DATABASE  IF NOT EXISTS `coffee_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coffee_shop`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: coffee_shop
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'john smith','johnSmith123@gmail.com'),(2,'Bob','Bob3@gmail.com'),(3,'Jane smith','Jane23@gmail.com'),(4,'Tim','Timmy@gmail.com'),(5,'Minh Nguyen','minhnguyen@gmail.com'),(6,'Jake','JakeSeoul@gmail.com'),(7,'Jahan','Janefasdfas@gmail.com'),(8,'Bobby','Bobby3@gmail.com'),(9,'Tom','tommy1234@gmail.com'),(10,'Johnny','JohnnyN@gmail.com'),(11,'Eric vong','Evong@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `Ingredient_id` int NOT NULL AUTO_INCREMENT,
  `Ingredient_name` varchar(30) NOT NULL,
  `Unit_price` double NOT NULL,
  PRIMARY KEY (`Ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'coffee bean bag',1.5),(2,'coffee creamer',0.01),(3,'Whipped cream',1),(4,'espresso shot',1),(5,'cocoa powder bag',2),(6,'whole milk (gal)',2),(7,'2% milk/gal (gal)',2),(8,'low fat milk (gal)',2),(9,'chocolate box',3),(10,'sugar packet',0.01);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `Inventory_id` int NOT NULL AUTO_INCREMENT,
  `Location` varchar(20) NOT NULL,
  `Quantity` int NOT NULL,
  `Product_id` int NOT NULL,
  PRIMARY KEY (`Inventory_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (18,'ShelfA',10,1),(19,'ShelfB',10,50),(20,'ShelfC',5,51),(21,'FridgeA',4,52),(22,'FridgeB',5,53),(23,'FridgeC',6,54),(24,'FridgeA',7,55),(25,'FridgeA',2,56);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `Order_date` date NOT NULL,
  `Total_price` double NOT NULL,
  `Quantity` int NOT NULL,
  `Payment_method` varchar(10) NOT NULL,
  `Customer_id` int NOT NULL,
  `Product_id` int NOT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-10-20',8,2,'card',1,1),(2,'2022-10-20',8,2,'cash',2,1),(3,'2022-10-21',4,2,'apple pay',1,51),(4,'2022-11-22',9,2,'card',3,51),(5,'2022-10-21',8,2,'cash',4,1),(6,'2022-12-19',10,2,'apple pay',5,56),(7,'2022-11-21',8,2,'card',6,54),(8,'2022-10-23',5,2,'cash',2,1),(9,'2022-10-22',8,2,'cash',1,53),(10,'2022-01-21',11,2,'card',3,55);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_id` int NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(20) NOT NULL,
  `Product_description` varchar(200) NOT NULL,
  `Price` double NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Recipe_id` int DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `Recipe_id` (`Recipe_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Recipe_id`) REFERENCES `recipe` (`Recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Espresso','The espresso, also known as a short black, is approximately 1 oz. of highly concentrated coffee. Although simple in appearance, it can be difficult to master.',5,1,1),(50,'Double Espresso','A double espresso may also be listed as doppio, which is the Italian word for double. This drink is highly concentrated and strong.',5,1,2),(51,'Red Eye','The red eye\'s purpose is to add a boost of caffeine to your standard cup of coffee.',6,1,3),(52,'Americano','Soldiers would add water to their coffee to extend their rations farther. The water dilutes the espresso while still maintaining a high level of caffeine.',7,1,4),(53,'Macchiato','Flavoring syrups are often added to the drink according to customer preference.',8,1,5),(54,'Cappuccino','This creamy coffee drink is usually consumed at breakfast time in Italy and is loved in the United States as well. Thick foam layer and additional flavorings that can be added to it.',5,1,6),(55,'Cafe Latte','Cafe lattes are considered an introductory coffee drink since the acidity and bitterness of coffee are cut by the amount of milk in the beverage.',4.5,1,7),(56,'Mocha',' The chocolate powder or syrup gives it a rich and creamy flavor and cuts the acidity of the espresso.',3.1,1,8),(57,'Iced Coffee','Often, different flavoring syrups will be added per the preference of the customer. You can even top it off with some cold foam.',2.5,1,9);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `Recipe_id` int NOT NULL AUTO_INCREMENT,
  `Recipe_name` varchar(30) NOT NULL,
  `Recipe_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Espresso','Ratio: 1 shot of espresso, Cup: 2-4 oz. Espresso Cup'),(2,'Double Espresso','Ratio: 2 shots of espresso, Cup: 3-4 oz. Demitasse Cup'),(3,'Red Eye','Ratio: 1 shot of espresso + 6 oz. of drip-brewed coffee, Cup: 8 oz. Coffee Mug'),(4,'Americano','Ratio: 1 shot of espresso + 3 oz. of hot water, Cup: 5-6 oz. Glass Coffee Mug'),(5,'Macchiato','Ratio: 1 shot of espresso + 1 to 2 teaspoons of steamed milk, Cup: 3 oz. Glass Espresso Cup'),(6,'Cappuccino','Ratio: 1-2 shots of espresso + 2 oz. of steamed milk + 2 oz. of foamed milk + sprinkling of chocolate powder (optional), Cup: 6-8 oz. Cappuccino Mug'),(7,'Cafe Latte','Ratio: 1 shot of espresso + 8-10 oz. of steamed milk + 1 cm of foam, Cup: 6-9 oz. Coffee Mug'),(8,'Mocha','Ratio: 1 shot of espresso + 1-2 oz. of chocolate syrup/powder + 1-3 oz. of steamed milk + 2-3 cm of foam or whipped cream, Cup: 6-8 oz. Irish Coffee Mug'),(9,'Iced Coffee','Ratio: 2 oz. drip coffee or espresso + 4 oz. of ice + 4-6 oz of milk or water + flavoring syrup to taste, Cup: 14 oz. Mixing Glass');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `Schedule_id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`Schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'Wed 9am-5pm, Thur 9am-5pm'),(2,'Mon 9am-5pm, Tues 9am-5pm'),(3,'Fri 9am-5pm, Sat 9am-5pm'),(4,'Wed 9am-1pm, Thur 9am-1pm'),(5,'Mon 9am-1pm, Tues 9am-1pm'),(6,'Fri 9am-1pm, Sat 9am-5pm'),(7,'Wed 1pm-5pm, Thur 1pm-5pm'),(8,'Mon 1pm-5pm, Tues 1pm-5pm'),(9,'Fri 1pm-5pm, Sat 1pm-5pm');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_id` int NOT NULL AUTO_INCREMENT,
  `Schedule_id` int NOT NULL,
  `First_name` varchar(10) NOT NULL,
  `Last_name` varchar(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Job_title` varchar(10) NOT NULL,
  PRIMARY KEY (`Staff_id`),
  KEY `Schedule_id` (`Schedule_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Schedule_id`) REFERENCES `schedule` (`Schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,'Minh','Nguyen','min47@gmail.com','4085443299','Supervisor'),(2,1,'Kevin','Chad','k873492@gmail.com','4085447779','Employee'),(3,2,'Dan','Le','dandog@gmail.com','4085469779','Employee'),(4,3,'Kog','Big','bbdacog@gmail.com','4090469779','Janitor'),(5,3,'Holly','Steward','whiteffdsa@gmail.com','4080468889','Cashier'),(6,1,'Mary','Garcia','dfadsmexdkjaf@gmail.com','4090400079','Manager'),(7,2,'Heather','Big','bbdacog@gmail.com','4090469779','Janitor'),(8,3,'Showee','Small','bshawdee@gmail.com','4080469999','Barista');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Supplier_id` int NOT NULL AUTO_INCREMENT,
  `Supplier_name` varchar(20) NOT NULL,
  `Contact_name` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  PRIMARY KEY (`Supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'CoffeeBeanInc','Josh Manny','1231 Cool Dr. San Jose CA','JoshM@gmail.com','4083242345'),(2,'CoffeePowderInc','Josh Love','1241 Cooler Dr. San Jose CA','JosssshM@gmail.com','4083242645'),(3,'Costco','Joshua Ho','1241 Coolest Dr. San Jose CA','JosssssdfsfashM@gmail.com','4082242345'),(4,'CupCompany','Cupper Co','1241 Coolio Dr. San Jose CA','Cupman@gmail.com','4082242785'),(5,'Beverage Toxic','Joshy Cok','1241 Coooolest Dr. San Jose CA','JossM@gmail.com','4081112345');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 12:51:12
