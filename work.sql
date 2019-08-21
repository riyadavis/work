create DATABASE work;

create TABLE deliveryAddress(id int PRIMARY KEY AUTO_INCREMENT, customerName varchar(25), customerAddress text, deliveryPincode int,landmark text, mobileNumber varchar(12),deliverTo varchar(10));

CREATE TABLE category(category_id int PRIMARY KEY AUTO_INCREMENT,category_name varchar(20),product_tag text);
CREATE TABLE coupon(coupon_id int PRIMARY key AUTO_INCREMENT,coupon_code varchar(8), category_id int, FOREIGN KEY (category_id)REFERENCES category(category_id));

INSERT INTO `category`( `category_name`, `product_tag`) VALUES ('Books','Fiction, non Fiction, Educational books');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Gaming','Gaming consoles, Smart Glasses');
INSERT INTO `category`(`category_name`, `product_tag`) VALUES ('Air Conditioner','Split AC, Inverter AC, Window AC');
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('BOX100','1');
INSERT INTO `coupon`(`coupon_code`, `category_id`) VALUES ('GAME500','2');
INSERT INTO `coupon`( `coupon_code`, `category_id`) VALUES ('AC5000','3');
