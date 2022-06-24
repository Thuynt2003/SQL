use Lab11

create table Customers(
CustomersID nvarchar(100) primary key,
CustomersName varchar(50),
Address nvarchar(50),
PhoneNumber varchar(20)
)
create table Products(
STT  int IDENTITY(1,1),
ProductsID nvarchar(100) primary key,
ProductsName nvarchar(50),
ItemDescription varchar(100),
unit varchar(10),
Price int
)
create table Orders(
OrdersID nvarchar(100) primary key,
CustomersID nvarchar(100),
CONSTRAINT fk_CustomersID FOREIGN KEY (CustomersID)REFERENCES Customers(CustomersID),
DateBuy datetime,
ProductsID nvarchar(100),
CONSTRAINT fk_ProductsID FOREIGN KEY (ProductsID)REFERENCES Products(ProductsID),
CurrentPrice int ,
Amount int
)

INSERT INTO Customers(CustomersID,CustomersName,Address,PhoneNumber) VALUES
('142b01fc-27cf-4278-9d30-41a2d38ce63b','Nguyen Van An','111 Nguyễn Trãi, Thanh Xuân, Hà Nội','0987654321'),
('6418592e-76d6-4f76-a632-123cbfb0c500','Hoang Tu Anh','908 Truong Duong','088745612'),
('786fcd77-2e65-4c0e-8ed4-b024653436e3','Nguyen Khanh Ngoc','507 Dinh Tien Hoang','088658963'),
('b06f5ca6-c1cb-4b37-ad8b-67dc4443345e','Chau Ngoc Phuong','722 Mai Xuan Thuong','088450203'),
('e286f361-012c-4901-8c7e-6f68301acd85','Mai Kieu Oanh','456 Nguyen Cong Tru','088476502')

INSERT INTO Products(ProductsID,ProductsName,ItemDescription,unit,Price) values
('d501050d-a03c-4367-925f-7e5244e600cc','May Tinh 450','May Nhap Moi','Chiec',1000),
('be2ea7bb-622f-4ef5-9726-03b45c8ff6f0','Dien Thoai Nokia 5670','Dien Thoai Dang Hot','Chiec',200),
('859a6831-d629-4315-9332-e86bc2e0d960','May In Samsung 450','May In Dang E','Chiec',100)

INSERT INTO Orders(OrdersID,CustomersID,DateBuy,ProductsID,CurrentPrice,Amount) values
('bee5ea22-32c7-4385-9de8-56dbd00eee7c','142b01fc-27cf-4278-9d30-41a2d38ce63b','20220113','d501050d-a03c-4367-925f-7e5244e600cc',1500,1),
('0561d49b-bf7f-44ca-a515-51736b2841c0','142b01fc-27cf-4278-9d30-41a2d38ce63b','20220214','be2ea7bb-622f-4ef5-9726-03b45c8ff6f0',230,2),
('8ab7c151-b0f8-4b5f-a8ee-32a4a68b7ef8','142b01fc-27cf-4278-9d30-41a2d38ce63b','20220315','859a6831-d629-4315-9332-e86bc2e0d960',200,1),
('47213dc7-a86c-4b71-9537-2a2a6070cb50','6418592e-76d6-4f76-a632-123cbfb0c500','20220416','be2ea7bb-622f-4ef5-9726-03b45c8ff6f0',230,2),
('489481bb-619c-4729-9dbd-b0a07d02a043','6418592e-76d6-4f76-a632-123cbfb0c500','20220517','859a6831-d629-4315-9332-e86bc2e0d960',200,1),
('f2651f11-9975-4ccd-9f23-8052f8785380','786fcd77-2e65-4c0e-8ed4-b024653436e3','20220618','d501050d-a03c-4367-925f-7e5244e600cc',1500,1),
('5a3ee8dc-48fb-4db6-a741-fecf48b4a9ce','b06f5ca6-c1cb-4b37-ad8b-67dc4443345e','20220109','859a6831-d629-4315-9332-e86bc2e0d960',200,1),
('3b7f36e1-98c4-4e8f-85bf-5602fe5d7127','b06f5ca6-c1cb-4b37-ad8b-67dc4443345e','20220220','d501050d-a03c-4367-925f-7e5244e600cc',1500,1),
('e3c0568e-949d-4347-9429-1b1fb0f67cb8','e286f361-012c-4901-8c7e-6f68301acd85','20220304','be2ea7bb-622f-4ef5-9726-03b45c8ff6f0',230,2)

select Customers.CustomersName from Customers
select Products.ProductsName from Products
select Orders.OrdersID from Orders


select CustomersName from Customers order by CustomersName
select Products.ProductsName from Products order by Price desc /* giảm dần */
select Products.ProductsName from Products order by Price asc /* tăng dần*/
select Products.ProductsName from Products join Orders on Products.ProductsID = Orders.ProductsID where CustomersID='142b01fc-27cf-4278-9d30-41a2d38ce63b'

select Count (Customers.CustomersName) from Customers
select Count (Products.ProductsName) from Products
alter table Orders add TotalOrder as  CurrentPrice*Amount 
select OrdersID, TotalOrder from Orders


Alter table Products add constraint ck_Price check (Price >0)
Alter table Orders add constraint ck_DateBuy check (DateBuy <= GETDATE())
Alter table Products add productdate datetime

CREATE INDEX id_ProductsName ON Products (ProductsName)
CREATE INDEX id_CustomersName ON Customers (CustomersName)

create view v_Customers as 
select CustomersName,Address,PhoneNumber from Customers
create view v_Products as 
select ProductsName,Price from Products
create view v_ProductsName_CustomersName as
select CustomersName,PhoneNumber,ProductsName,DateBuy,Amount from Customers 
join Orders on Orders.CustomersID=Customers.CustomersID 
join Products on Products.ProductsID=Orders.ProductsID
select *from v_ProductsName_CustomersName 

create procedure sp_CustomersName @CustomersID varchar(50)
as
select Customers.CustomersName from Customers where Customers.CustomersID = @CustomersID
 EXECUTE sp_CustomersName @CustomersID = '6418592e-76d6-4f76-a632-123cbfb0c500'
 create procedure sp_information_Customers @OrdersID varchar(50)
as
select Customers.CustomersName,Customers.Address,Customers.PhoneNumber from Customers join Orders on Customers.CustomersID =Orders.CustomersID where Orders.OrdersID = @OrdersID
 EXECUTE sp_information_Customers @OrdersID = 'bee5ea22-32c7-4385-9de8-56dbd00eee7c'
 create procedure sp_Product @CustomersID varchar(50)
as
select Products.ProductsName from Products join Orders on Products.ProductsID =Orders.ProductsID where Orders.CustomersID = @CustomersID
 EXECUTE sp_Product @CustomersID = 'b06f5ca6-c1cb-4b37-ad8b-67dc4443345e'
 
 drop procedure IF EXISTS sp_Product