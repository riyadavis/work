CREATE TABLE deliveryInfo(id int PRIMARY KEY AUTO_INCREMENT, customer_id int, HomeAddress text,WorkAddress text, Other text);
CREATE TABLE customer(id int PRIMARY KEY AUTO_INCREMENT,customer_name varchar(20),customer_mobile int(10),DateOfJoining timestamp);
ALTER table deliveryinfo ADD FOREIGN KEY(customer_id) REFERENCES customer(id);

INSERT INTO `customer`(`customer_name`, `customer_mobile`, `DateOfJoining`) VALUES ('Riya','1234567890','2019-08-24 02:36:31');