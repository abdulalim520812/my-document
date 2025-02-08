-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2025 at 12:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_com`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewCategory` (IN `c_name` VARCHAR(100), OUT `msg` VARCHAR(100))   BEGIN

	DECLARE exist int;
	SELECT COUNT(*) INTO exist 
	FROM categories 
	WHERE name = c_name;

	IF exist > 0 THEN
		SET msg = 'category already exists!';
	ELSE
		START TRANSACTION;
INSERT INTO categories(name) VALUES(c_name);
		SET msg = 'category added successfully!';
		COMMIT;
	
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewProduct` (IN `p_name` VARCHAR(100), IN `p_price` DECIMAL(10,2), IN `p_stock` INT, IN `p_category_id` INT, IN `p_shop_id` INT)   BEGIN
INSERT INTO products(name,price, stock, category_id, shop_id) VALUES(p_name, p_price,p_stock,p_category_id,p_shop_id); 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewShop` (IN `s_name` VARCHAR(100), IN `s_user_id` INT)   BEGIN
INSERT INTO shops(name, user_id) VALUES(s_name, s_user_id );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewUser` (IN `u_name` VARCHAR(100), IN `u_contact` VARCHAR(100))   BEGIN

INSERT INTO users(name, contact) values(u_name, u_contact);

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calculatePrice` (`p_name` VARCHAR(100), `p_quantity` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN

DECLARE p_price decimal(10,2);
DECLARE p_stock INT;
DECLARE total_price decimal(10,2);

SELECT price INTO p_price
FROM products
where name= p_name;


SELECT stock INTO p_stock 
FROM products
WHERE name = p_name;



IF p_stock >=p_quantity THEN
RETURN CONCAT('total price will be:', p_price * p_quantity);
ELSE
RETURN 'product not available';
END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `message`) VALUES
(1, 'new user added successfully: tarikul');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `description`, `shop_id`, `category_id`) VALUES
(1, 'potato', 70.00, 100, NULL, 1, 1),
(2, 'onion', 40.00, 100, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_shop_user_view`
-- (See below for the actual view)
--
CREATE TABLE `product_shop_user_view` (
`p_name` varchar(100)
,`s_name` varchar(100)
,`u_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cantact` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `cantact`, `user_id`) VALUES
(1, 'abc', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `contact`, `role`, `is_active`) VALUES
(5, 'tarikul', '0195665525', 1, 1);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `LogNewUser` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO logs(message) VALUES(CONCAT('new user added successfully: ', NEW.name));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `product_shop_user_view`
--
DROP TABLE IF EXISTS `product_shop_user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_shop_user_view`  AS SELECT `products`.`name` AS `p_name`, `shops`.`name` AS `s_name`, `users`.`name` AS `u_name` FROM ((`products` join `shops` on(`products`.`shop_id` = `shops`.`id`)) join `users` on(`shops`.`user_id` = `users`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact` (`contact`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
