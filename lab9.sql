CREATE DATABASE Lab11
GO
USE Lab11
CREATE VIEW ProductList
AS
SELECT ProductID, Name FROM AdventureWorks2019.Production.Product
SELECT * FROM ProductList

CREATE VIEW SalesOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
FROM AdventureWorks2019.Sales.SalesOrderDetail od
JOIN AdventureWorks2019.Production.Product pr
ON od.ProductID=pr.ProductID

SELECT * FROM SalesOrderDetail

create table Customer(
CustomerID int primary key,
CustomerName varchar(50),
Address varchar(100),
Phone varchar(12)
)
create table Book(
BookCode int primary key,
BookName varchar(100),
Category varchar(50),
Author  varchar(100),
Publisher varchar(50),
Price int ,
InStore int
)
create table BookSold(
BookSoldID int primary key,
CustomerID int ,
CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID)REFERENCES Customer(CustomerID),
BookCode int,
CONSTRAINT fk_BookCode FOREIGN KEY (BookCode)REFERENCES  Book(BookCode),
Date datetime,
Price int,
Amount int
)
INSERT INTO Book(BookCode,BookName,Category,Author,Publisher,Price,InStore)VALUES(1,'Len gac rut thang',' kinh te,chinh tri','Ha-Joon Chang','Nha xuat ban lao dong',63200,3)
INSERT INTO Book(BookCode,BookName,Category,Author,Publisher,Price,InStore)VALUES(2,'Ban khong','chuyen nghanh','Michael Lewis','NXB Lao Dong _Ha Noi',119200,5)
INSERT INTO Book(BookCode,BookName,Category,Author,Publisher,Price,InStore)VALUES(3,'Triet li cuoc doi','kinh te,chinh tri','Jim Rohn','NXB Lao Dong',31500,3)
INSERT INTO Book(BookCode,BookName,Category,Author,Publisher,Price,InStore)VALUES(4,'The Ugly Duckling','Thieu nhi','Arianan Candell Daniel Howarth','NXB Kim Dong',27500,6)
INSERT INTO Book(BookCode,BookName,Category,Author,Publisher,Price,InStore)VALUES(5,'Small Talk','ki nang','Debra Fine','NXB Cong Thuong',58500,2)

INSERT INTO Customer(CustomerID,CustomerName,Address,Phone)VALUES(6,'Nguyen Thi Thuy','Vinh Phuc','123456789')
INSERT INTO Customer(CustomerID,CustomerName,Address,Phone)VALUES(7,'Duong Thanh Hieu','Vinh Phuc','23456789')
INSERT INTO Customer(CustomerID,CustomerName,Address,Phone)VALUES(8,'Nguyen Duy Hoang','TPHCM','3456789')
INSERT INTO Customer(CustomerID,CustomerName,Address,Phone)VALUES(9,'Nguyen Duy Sang','Hai Phong','456789')
INSERT INTO Customer(CustomerID,CustomerName,Address,Phone)VALUES(10,'Dinh Thi Hang','Ha Noi','56789')

INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(11,6,1,'20130607',63000,1)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(12,7,2,'20130713',11900,2)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(13,8,3,'20150915',31000,2)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(14,9,4,'20201217',27000,3)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(15,10,5,'20211109',58000,1)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(16,10,1,'20140512',62000,1)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(17,9,2,'20150608',109000,1)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(18,8,3,'20191203',30000,2)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(19,7,4,'20220501',20000,3)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(20,6,5,'20210711',50000,1)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount) VALUES(21,8,4,'20120323',30500,2)

create view v_Book As
Select Book.BookCode,Book.BookName,BookSold.Price,BookSold.Amount from Book inner join BookSold on Book.BookCode=BookSold.BookCode
select * from v_Book

DROP VIEW IF EXISTS v_Customer
create view v_Customer AS 
select distinct Customer.CustomerID,Customer.CustomerName,Customer.Address,BookSold.Amount from Customer inner Join BookSold on Customer.CustomerID=BookSold.CustomerID 
select *from v_Customer

DROP VIEW IF EXISTS v_buybook
create view v_buybook As 
select c.CustomerID, c.CustomerName, c.Address, c.Phone, b.BookName from Customer as c 
JOIN BookSold as bs on c.CustomerID = bs.CustomerID
JOIN Book as b on bs.BookCode = b.BookCode
select * from v_buybook

create view v_total_price As
select c.CustomerName, sum(bs.Price) as TotalPrice from BookSold bs
JOIN Customer as c on c.CustomerID = bs.CustomerID
JOIN Book as b on b.BookCode = bs.BookCode
group by c.CustomerName
select *from v_total_price