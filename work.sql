create DATABASE work;

create TABLE deliveryAddress(id int PRIMARY KEY AUTO_INCREMENT, customerName varchar(25), customerAddress text, deliveryPincode int,landmark text, mobileNumber varchar(12),deliverTo varchar(10));

CREATE TABLE category(id int PRIMARY KEY AUTO_INCREMENT,category_name varchar(20),product_tag text);
INSERT INTO `category`( `category_name`, `product_tag`) VALUES ('Books','Fiction, non Fiction, Educational books');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Gaming','Gaming consoles, Smart Glasses');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Air Conditioner','Split AC, Inverter AC, Window AC');

CREATE TABLE coupon(id int PRIMARY key AUTO_INCREMENT,coupon_code varchar(8), category_id int, FOREIGN KEY (category_id)REFERENCES category(category_id));
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('BOX100','1');
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('GAME500','2');
INSERT INTO `coupon`( `coupon_code`, `category_id`) VALUES ('AC5000','3');

CREATE TABLE product(id int PRIMARY KEY AUTO_INCREMENT, product_name varchar(20), product_image varchar(20), product_price int(10));
INSERT INTO `product`(`product_name`, `product_image`, `product_price`) VALUES ('Mobile','1.jpg','15000');
INSERT INTO `product`(`product_name`, `product_image`, `product_price`) VALUES ('laptop','2.jpg','40000');

create table users(id int PRIMARY KEY AUTO_INCREMENT, mobile varchar(10));
INSERT INTO `users`(`mobile`) VALUES (9456789654);

create TABLE cart(id int PRIMARY KEY AUTO_INCREMENT, user_id int, product_id int, time_stamp timestamp, coupon_code varchar(20), FOREIGN KEY(user_id) REFERENCES users(id), FOREIGN KEY(product_id) REFERENCES product(id));
-- ALTER TABLE `cart` ADD `quantity` INT(5) AFTER `product_id`;

INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Mobiles', 'mobile , cheap mobiles, HD quality Mobiles');
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('MOB3000','4');

ALTER table product ADD category_id int;
ALTER TABLE product ADD FOREIGN KEY(category_id) REFERENCES category(id);
UPDATE `product` SET `category_id` = '4' WHERE `product`.`id` = 1; UPDATE `product` SET `category_id` = '2' WHERE `product`.`id` = 2;

ALTER TABLE `cart` ADD `order_id` INT AFTER `coupon_code`;
CREATE table customer_order(id int PRIMARY KEY AUTO_INCREMENT, time_stamp timestamp);
ALTER table customer_order ADD customer_id int ;
ALTER TABLE customer_order ADD FOREIGN KEY(customer_id) REFERENCES users(id);

ALTER TABLE `coupon` ADD `Discount%` VARCHAR(3) NOT NULL AFTER `coupon_code`, ADD `MaxusePC` INT(2) NOT NULL AFTER `Discount%`;
UPDATE `coupon` SET `Discount%` = '20', `MaxusePC` = '2' WHERE `coupon`.`id` = 1; UPDATE `coupon` SET `Discount%` = '30', `MaxusePC` = '2' WHERE `coupon`.`id` = 2; UPDATE `coupon` SET `Discount%` = '10', `MaxusePC` = '2' WHERE `coupon`.`id` = 3; UPDATE `coupon` SET `Discount%` = '15', `MaxusePC` = '2' WHERE `coupon`.`id` = 4;
 CREATE table couponSubscription(id int PRIMARY KEY AUTO_INCREMENT,customer_id int, coupon_id int,UseCount int, time_stamp timestamp);
 ALTER table couponsubscription ADD FOREIGN KEY(customer_id) REFERENCES customer(id), ADD FOREIGN KEY(coupon_id) REFERENCES coupon(id);
ALTER TABLE `product` ADD `hub_id` INT NOT NULL AFTER `category_id`, ADD `product_tags` VARCHAR(70) NOT NULL AFTER `hub_id`, ADD `max_discount` INT NOT NULL AFTER `product_tags`, ADD `min_discount` INT NOT NULL AFTER `max_discount`;
UPDATE `product` SET `hub_id` = '1', `product_tags` = 'HD quality, Cheap', `max_discount` = '35', `min_discount` = '5' WHERE `product`.`id` = 1; UPDATE `product` SET `hub_id` = '1', `product_tags` = 'HD display, High quality', `max_discount` = '30', `min_discount` = '10' WHERE `product`.`id` = 2;
ALTER TABLE `cart` CHANGE `user_id` `customer_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `cart` DROP `coupon_code`, DROP `order_id`;
ALTER TABLE `cart` ADD `items_added` TEXT NOT NULL AFTER `customer_id`, ADD `source_id` INT NOT NULL AFTER `items_added`;

drop table cart;
CREATE TABLE cart(id int PRIMARY key AUTO_INCREMENT,customer_id int,items_added text, source_id int,time_stamp timestamp,FOREIGN KEY(customer_id) REFERENCES customer(id));
CREATE TABLE distributor_hub(id int PRIMARY KEY AUTO_INCREMENT,distributor_id int,location_coordinate text,pickup_address text,image text,offer_id int);
ALTER TABLE `distributor_hub` ADD `hub_name` VARCHAR(50) NOT NULL AFTER `distributor_id`;


CREATE TABLE api_table(id int PRIMARY KEY AUTO_INCREMENT,salt char(32), FULLTEXT(salt));