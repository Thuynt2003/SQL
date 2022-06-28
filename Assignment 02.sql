create database Assignment_02
use  Assignment_02

create table Brand(
BrandID nvarchar(50) primary key,
BrandName varchar(50),
Address varchar(20),
Phone varchar(15),
)
create table Products(
ProductsID  nvarchar(50)primary key,
ProductsName nvarchar(50),
BrandID nvarchar(50),
CONSTRAINT fk_BrandID FOREIGN KEY (BrandID)REFERENCES Brand(BrandID),
ItemDescription varchar(100),
unit varchar(10),
Price int,
CurrentAmount int
)
INSERT INTO Brand(BrandID,BrandName,Address,Phone)values
('1fb575be-fd35','Apple','CF','0987654321'),
('be502ce7-208f','Asus','USA','0876543219'),
('d73e9fcc-05d9','Motorola','MI','0543219876')
INSERT INTO Products(ProductsID,ProductsName,BrandID,ItemDescription,unit,Price,CurrentAmount) values
('1e8cae01-e16d','May Tinh 450','1fb575be-fd35','May Nhap Moi','Chiec',1000,10),
('48ae-9de0','Dien Thoai Nokia 5670','be502ce7-208f','Dien Thoai Dang Hot','Chiec',200,200),
('f18df2a53312','May In Samsung 450','d73e9fcc-05d9','May In Dang E','Chiec',100,10)

select BrandName from Brand
select ProductsName from Products

select BrandName from Brand order by BrandName  desc
select Products.ProductsName from Products order by Price desc
select Brand.BrandID,Brand.Address,Brand.Phone from Brand where BrandName ='Asus'
select Products.ProductsName from Products where CurrentAmount < 11
select Products.ProductsName from Products join Brand on Products.BrandID=Brand.BrandID where  BrandName='Asus'

select count(BrandName) from Brand
select count(ProductsName) from Products
select count(ProductsName) from Products join Brand on Products.BrandID=Brand.BrandID where  BrandName='Apple'
select count(ProductsName) from Products join Brand on Products.BrandID=Brand.BrandID where  BrandName='Asus'
select count(ProductsName) from Products join Brand on Products.BrandID=Brand.BrandID where  BrandName='Motorola'
select Sum(CurrentAmount) as SumProduct from Products

Alter table Products add constraint ck_Price check (Price >0)
SELECT * FROM information_schema.key_column_usage     /* kiểm tra key trong table*/


CREATE INDEX id_ProductsName ON Products (ProductsName)
CREATE INDEX id_ItemDescription ON Products (ItemDescription)

create view v_Products as
select Products.ProductsID,Products.ProductsName,Products.Price from Products
create view v_Products_Brand as 
select Products.ProductsID,Products.ProductsName,Brand.BrandName from Products join Brand on Products.BrandID = Brand.BrandID

create procedure SP_Products_Brand @BrandName varchar(50) as
select Products.ProductsName from Products join Brand on Products.BrandID = Brand.BrandID where Brand.BrandName = @BrandName
EXECUTE SP_Products_Brand @BrandName = 'Apple'

create procedure sp_Products_price  @Price int as
select Products.ProductsName from Products where Products.Price>=@Price
execute sp_Products_price  @Price = 200

create procedure sp_Products_Amount @Amount int  as
select Products.ProductsName from Products where Products.CurrentAmount = @Amount
execute sp_Products_Amount @Amount=0 

