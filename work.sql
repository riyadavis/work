create DATABASE work;

create TABLE deliveryAddress(id int PRIMARY KEY AUTO_INCREMENT, customerName varchar(25), customerAddress text, deliveryPincode int,landmark text, mobileNumber varchar(12),deliverTo varchar(10));

CREATE TABLE category(category_id int PRIMARY KEY AUTO_INCREMENT,category_name varchar(20),product_tag text);
INSERT INTO `category`( `category_name`, `product_tag`) VALUES ('Books','Fiction, non Fiction, Educational books');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Gaming','Gaming consoles, Smart Glasses');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Air Conditioner','Split AC, Inverter AC, Window AC');

CREATE TABLE coupon(coupon_id int PRIMARY key AUTO_INCREMENT,coupon_code varchar(8), category_id int, FOREIGN KEY (category_id)REFERENCES category(category_id));
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('BOX100','1');
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('GAME500','2');
INSERT INTO `coupon`( `coupon_code`, `category_id`) VALUES ('AC5000','3');

CREATE TABLE product(id int PRIMARY KEY AUTO_INCREMENT, product_name varchar(20), product_image varchar(20), product_price int(10));
INSERT INTO `product`(`product_name`, `product_image`, `product_price`) VALUES ('Mobile','1.jpg','15000');
INSERT INTO `product`(`product_name`, `product_image`, `product_price`) VALUES ('laptop','2.jpg','40000');

create table users(id int PRIMARY KEY AUTO_INCREMENT, mobile varchar(10));
INSERT INTO `users`(`mobile`) VALUES (9456789654);

create TABLE cart(id int PRIMARY KEY AUTO_INCREMENT, user_id int, product_id int, time_stamp timestamp, coupon_code varchar(20), FOREIGN KEY(user_id) REFERENCES users(id), FOREIGN KEY(product_id) REFERENCES product(id));
ALTER TABLE `cart` ADD `quantity` INT(5) AFTER `product_id`;