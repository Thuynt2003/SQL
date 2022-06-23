IF EXISTS (SELECT * FROM sys.databases WHERE Name='ORDERCOMPANY')
DROP DATABASE ORDERCOMPANY
GO
CREATE DATABASE ORDERCOMPANY
GO
USE ORDERCOMPANY
GO
create table orders(
orderCode int,
orderer varchar(100),
address nvarchar(150),
numberPhone int,
orderDate date
)
create table list_of_product(
STT int IDENTITY (1,1),
NameProduct nvarchar(150),
ProductDescription varchar(100),
unit varchar(50),
price money,
amount int
)s
INSERT INTO orders(orderCode,orderer,address,numberPhone,orderDate) values(123,'Nguyen Van An','111 Nguyen Trai , Thanh Xuan , Ha Noi',987654321,2022-06-09)
INSERT INTO list_of_product(NameProduct,ProductDescription,unit,price,amount) values('May TinhT450','May nhap moi','chiec',1000,1)
INSERT INTO list_of_product(NameProduct,ProductDescription,unit,price,amount) values('Đien Thoai Nokia5670','Đien thoai đang hot','chiec',200,2)
INSERT INTO list_of_product(NameProduct,ProductDescription,unit,price,amount) values('May In Samsung 450','May in đang e','chiec',100,1)

ALTER TABLE list_of_product ADD IntoMoney as price*amount 