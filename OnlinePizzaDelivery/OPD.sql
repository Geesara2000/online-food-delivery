-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2024 at 11:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OPD`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(2, 'NON-VEG PIZZA', 'A non-vegetable pizza is topped with meats like pepperoni, sausage, ham, and bacon, offering a savory, protein-rich flavor.', '2021-03-17 18:17:14'),
(3, 'PIZZA MANIA', 'Pizza Mania is a restaurant chain known for offering a wide variety of delicious and affordable pizzas.', '2021-03-17 18:17:43'),
(4, 'SIDES ORDERS', 'Side orders include a variety of appetizers and snacks such as garlic bread, chicken wings, salads, and cheesy breadsticks.', '2024-07-05 22:01:18'),
(5, 'BEVERAGES', 'Beverages include a selection of soft drinks, bottled water, iced tea, juices, and specialty drinks to complement any meal.', '2024-07-05 15:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(1, 2, 'geesaradesilva92@gmail.com', 768527721, 0, 'ghgvhv', '2024-07-11 18:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(1, 1, 2, 'dfdsv', '2024-07-11 18:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 6, 1),
(2, 2, 11, 1),
(3, 3, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, '38/1 A,Thissa Road,Monaragala, ', 910005, 768527720, 199, '0', '1', '2024-07-11 18:59:38'),
(2, 2, '38/1 A,Thissa Road,Monaragala, ', 910004, 768527720, 99, '0', '0', '2024-07-11 19:03:49'),
(3, 2, '38/1 A,Thissa Road,Monaragala, ', 91000, 768527720, 99, '0', '0', '2024-07-11 19:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(1, 'DOUBLE CHEESE MARGHERITA', 1120, 'Double Cheese Margherita features a classic pizza topped with double the mozzarella cheese, fresh tomatoes, and aromatic basil leaves.', 1, '2021-03-17 21:20:58'),
(2, 'TANDOORI PANEER', 1100, 'Tandoori Paneer is a popular Indian dish featuring marinated paneer cubes grilled to perfection with spices, creating a smoky flavor.', 1, '2021-03-17 21:29:41'),
(3, 'FARM HOUSE', 1490, 'Farm House pizza features fresh vegetables like mushrooms, bell peppers, tomatoes, and onions, delivering a vibrant and healthy taste.', 1, '2021-03-17 21:22:07'),
(4, 'PEPPY PANEER', 1390, '\r\nPeppy Paneer is a vegetarian pizza topped with paneer cubes, crisp capsicum, spicy red paprika, and a flavorful tomato sauce.\r\n\r\n', 1, '2021-03-17 21:23:05'),
(5, ' MEXICAN GREEN WAVE', 1230, 'Mexican Green Wave is a flavorful dish featuring grilled chicken, avocado, salsa verde, lettuce, and cheese, wrapped in a warm tortilla.\r\n', 1, '2021-03-17 21:23:48'),
(6, 'PEPPER BARBECUE ', 1990, 'Pepper Barbecue is a savory dish featuring grilled meat seasoned with peppery spices and tangy barbecue sauce for a robust flavor experience.', 2, '2021-03-17 21:34:37'),
(7, 'CHICKEN SAUSAGE', 2490, 'Chicken sausage is a flavorful alternative to pork sausage, made from ground chicken meat seasoned with herbs and spices.', 2, '2021-03-17 21:35:31'),
(8, 'CHICHKEN DELIGHT', 2490, 'Chicken Golden Delight features crispy fried chicken served with golden French fries and a side of tangy dipping sauce for a delightful meal.', 2, '2021-03-17 21:36:36'),
(9, 'NON-VEG SUPREME', 3990, 'Non-Veg Supreme pizza features a savory combination of meats like pepperoni, sausage, chicken, and toppings like bell peppers and mushrooms.', 2, '2021-03-17 21:37:21'),
(10, 'CHICHKEN DOMINATOR', 3190, 'Chicken Dominator pizza features a robust combination of grilled chicken, spicy chicken chunks, onions, bell peppers, and a tangy tomato sauce.', 2, '2021-03-17 21:38:13'),
(11, 'TOMATO', 990, 'Tomato is a versatile fruit often used in cooking, known for its juicy texture, sweet-tart flavor, and rich nutritional content.', 3, '2021-03-17 21:44:44'),
(12, 'VEG LOADED', 1300, 'Veg Loaded refers to dishes rich in vegetables, like salads, pastas, and pizzas, providing hearty and flavorful vegetarian options.', 3, '2021-03-17 21:45:34'),
(13, 'CHEESY', 1500, 'Cheesy describes foods enriched with melted or grated cheese, creating a savory, gooey texture and enhancing flavor with creamy richness.', 3, '2021-03-17 21:46:21'),
(14, 'CAPSICUM', 1450, 'Capsicum, also known as bell pepper, is a colorful vegetable with a mild, sweet flavor used in cooking for its crisp texture.', 3, '2021-03-17 21:47:07'),
(15, 'ONION', 990, 'Onion is a versatile vegetable known for its pungent flavor, used in cooking worldwide for its culinary and nutritional benefits.', 3, '2021-03-17 21:47:51'),
(16, 'GARLIC BREADSTICKS', 650, 'Garlic breadsticks are freshly baked breadsticks brushed with garlic butter and sprinkled with herbs, perfect for dipping in marinara sauce.\r\n\r\n', 4, '2021-03-17 22:01:33'),
(17, 'STUFFED GARLIC BREAD', 580, 'Stuffed garlic bread features crispy crust filled with melted cheese and garlic, served hot and seasoned for a savory snack or side.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 4, '2021-03-17 22:02:50'),
(18, 'PASTA ITALIANO', 890, 'Pasta Italiano features classic Italian pasta dishes like spaghetti, lasagna, carbonara, and alfredo, crafted with authentic ingredients and flavors.', 4, '2021-03-17 22:03:44'),
(19, 'ITALIANO WHITE', 780, 'Italiano White Pasta features creamy Alfredo sauce with Parmesan cheese, served with choice of chicken, shrimp, or vegetables for a satisfying meal.', 4, '2021-03-17 22:05:08'),
(20, 'LIPTON ICE TEA', 300, ' 500ml', 5, '2021-03-17 22:12:53'),
(21, 'MIRINDA', 350, '500ml', 5, '2021-03-17 22:13:38'),
(22, 'PEPSI', 350, '500ml', 5, '2021-03-17 22:16:29'),
(23, '7UP', 350, '500ml', 5, '2024-07-06 21:35:25'),
(24, 'DRINKING WATER', 200, '500ml                          \r\n\r\n\r\n\r\n', 5, '2021-03-18 08:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'PIZZA WORLD', 'pizzaworld@gmail.com', 11111111111, 2222222222, 'Colombo 07', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(2, 'imal', 'Geesara', 'silva', 'geesaradesilva92@gmail.com', 768527721, '0', '$2y$10$oB/mv7F3yhKIIU0wi2QCpeFnzIzAjInW3MIc.gD3d9UIUMXc.bWgW', '2024-07-11 11:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
