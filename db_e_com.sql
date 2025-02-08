-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2025 at 03:54 PM
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
-- Database: `db_e_com`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNeweCategory` (IN `c_name` VARCHAR(100), OUT `msg` VARCHAR(100))   BEGIN
DECLARE exist int;
SELECT COUNT(*) INTO exist FROM categories WHERE name = c_name;

IF exist > 0 THEN
SET msg = 'Category already exists';

ELSE
START TRANSACTION;
INSERT INTO categories(name) VALUES(c_name);
SET msg = 'Category added successfully';
COMMIT;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewProduct` (IN `p_name` VARCHAR(100), IN `p_price` DECIMAL(10,2), IN `p_stock` INT, IN `p_category_id` INT, IN `p_shop_id` INT)   BEGIN
   INSERT INTO products(name, price, stock, category_id, shop_id) VALUES(p_name, p_price, p_stock, p_category_id, p_shop_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewShop` (IN `s_name` VARCHAR(100), IN `s_user_id` INT)   BEGIN
   INSERT INTO shops(name, user_id) VALUES(s_name, s_user_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewUser` (IN `u_name` VARCHAR(100), IN `u_contact` VARCHAR(100))   BEGIN
INSERT INTO users(name, contact) VALUES(u_name, u_contact);

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calculatePrice` (`p_name` VARCHAR(100), `p_quantity` INT) RETURNS VARCHAR(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
DECLARE p_price decimal(10,2);
DECLARE p_stock int;
SELECT price, stock INTO p_price, p_stock FROM products WHERE name = p_name;
IF p_stock >= p_quantity THEN
RETURN CONCAT('Total Price: ', p_price * p_quantity) ;


ELSE RETURN 'Product Not Available';
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
(2, 'vegetables');

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
(1, 'New user added successfully:Alim'),
(2, 'New user added successfully:Fahim');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category_id`, `shop_id`) VALUES
(4, 'potato', NULL, 70.00, 100, 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_shop_user_view`
-- (See below for the actual view)
--
CREATE TABLE `product_shop_user_view` (
`product_name` varchar(100)
,`shop_name` varchar(100)
,`owner_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `contact`, `user_id`) VALUES
(2, 'Oishe Super Shop', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `contact`, `mail`, `role`, `status`) VALUES
(1, 'Alim', '01837763581', NULL, 1, 1),
(2, 'Fahim', '01837763582', NULL, 1, 1);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `LogNewUser` AFTER INSERT ON `users` FOR EACH ROW BEGIN
   INSERT INTO logs(message) VALUES(CONCAT('New user added successfully:', NEW.name));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `product_shop_user_view`
--
DROP TABLE IF EXISTS `product_shop_user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_shop_user_view`  AS SELECT `products`.`name` AS `product_name`, `shops`.`name` AS `shop_name`, `users`.`name` AS `owner_name` FROM ((`products` join `shops` on(`products`.`shop_id` = `shops`.`id`)) join `users` on(`shops`.`user_id` = `users`.`id`)) ;

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
  ADD KEY `category_id` (`category_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`);

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
