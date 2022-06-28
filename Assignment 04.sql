create database Assignment_04

use Assignment_04

create table Person_Responsible(
Person_responsibleID nvarchar(30) primary key,
Person_ResponsibleName varchar(30)
)
create table Products(
ProductsID  nvarchar(50)primary key,
ProductsName nvarchar(50),
productType  varchar(30),
DateManufacture datetime
)
create table Product_Coupons(
Product_CouponsID nvarchar(30) primary key,
ProductsID  nvarchar(50),
CONSTRAINT fk_ProductsID FOREIGN KEY (ProductsID)REFERENCES Products(ProductsID),
Person_responsibleID nvarchar(30),
CONSTRAINT fk_Person_responsibleID FOREIGN KEY (Person_responsibleID)REFERENCES Person_responsible(Person_responsibleID),
)

INSERT INTO Person_Responsible(Person_responsibleID,Person_ResponsibleName) values 
('987688','Nguyen Van An'),
('76faf3c01ecc','Nguyen Nguyet Nga'),
('76faf3c03ecb','Chau Ngoc Phuong')

INSERT INTO Products(ProductsID,ProductsName,productType,DateManufacture) values
('1e8cae01-e16d','May Tinh 450','may tinh','20211201'),
('Z37E','Máy tính sách tay huawei Matebook','May Tinh Sach Tay Z37','20121209'),
('48ae-9de0','Dien Thoai Nokia 5670','Dien Thoai','20220301'),
('f18df2a53312','May In Samsung 450','May in','20190217')

INSERT INTO Product_Coupons(Product_CouponsID,ProductsID,Person_responsibleID)values('Z37 111111','Z37E','987688'),
('7f0d49e5','48ae-9de0','987688'),
('544f6f7a','1e8cae01-e16d','987688'),
('b6adbff86934','f18df2a53312','987688'),
('7ad6bf94','f18df2a53312','76faf3c01ecc'),
('1dd5f1aab1fe','1e8cae01-e16d','76faf3c01ecc'),
('93324121','48ae-9de0','76faf3c01ecc'),
('d0bb1e913ee9','Z37E','76faf3c01ecc'),
('ed979d41','Z37E','76faf3c03ecb'),
('ba753ff86434','48ae-9de0','76faf3c03ecb'),
('904a1aa1','1e8cae01-e16d','76faf3c03ecb'),
('e71a9d3544fe','f18df2a53312','76faf3c03ecb')

--Liệt kê danh sách loại sản phẩm của công ty.
select Products.ProductsName from Products
--Liệt kê danh sách sản phẩm của công ty.
select Products.productType from Products
--Liệt kê danh sách người chịu trách nhiệm của công ty.
select Person_Responsible.Person_ResponsibleName from Person_Responsible
--Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
select Products.productType from Products  order by productType
--Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
select Person_Responsible.Person_ResponsibleName  from Person_Responsible order by Person_ResponsibleName
--Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E.
select Products.ProductsName from Products where Products.ProductsID='Z37E'
--Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm đần của mã
select  Products.ProductsName from Products
join Product_Coupons on Products.ProductsID=Product_Coupons.ProductsID
Join Person_Responsible on Person_Responsible.Person_responsibleID=Product_Coupons.Person_responsibleID 
where Person_Responsible.Person_ResponsibleName='Nguyen Van An' 
Order by Products.ProductsID DESC
--Số sản phẩm của từng loại sản phẩm.
select Products.productType,count (Products.ProductsName) as 'SumProduct'from Products group by  Products.productType
--Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm.
select Products.ProductsName,Products.productType from Products
--Hiển thị toàn bộ thông tin về người chịu trách nhiêm, loại sản phẩm và sản phẩm.
select  Person_Responsible.Person_ResponsibleName,Products.ProductsName,Products.productType from Person_Responsible 
Join Product_Coupons on Person_Responsible.Person_responsibleID=Product_Coupons.Person_responsibleID 
join Products on Products.ProductsID=Product_Coupons.ProductsID 
--Viết câu lệnh để thay đổi trường ngày sản xuất là trước hoặc bằng ngày hiện tại.
--Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
alter table Product_Coupons drop constraint fk_ProductsID,fk_Person_responsibleID
alter table Products drop constraint  PK__Products__BB48EDC5BD04C864
alter table Person_Responsible drop constraint PK__Person_R__0996E7620CD4D00D
--Đặt chỉ mục (index) cho cột tên người chịu trách nhiệm
create index id_Person_ResponsibleName on Person_Responsible(Person_ResponsibleName)
--View_SanPham: Hiển thị các thông tin Mã sản phẩm, Ngày sản xuất, Loại sản phẩm
create view v_product as 
select Products.ProductsID,Products.DateManufacture,Products.productType from Products
--View_SanPham_NCTN: Hiển thị Mã sản phẩm, Ngày sản xuất, Người chịu trách nhiệm
alter table Person_Responsible add constraint PK__Person_R__0996E7620CD4D00D primary key (Person_responsibleID)
alter table Products add constraint  PK__Products__BB48EDC5BD04C864 primary key (ProductsID)
alter table Product_Coupons add constraint fk_ProductsID foreign key (ProductsID)references Products(ProductsID) 
alter table Product_Coupons add constraint fk_Person_responsibleID foreign key (Person_responsibleID)references Person_Responsible(Person_responsibleID) 

create view v_product_NCTN as
select Products.ProductsID,Products.DateManufacture,Person_Responsible.Person_ResponsibleName from Products
join Product_Coupons on Products.ProductsID= Product_Coupons.ProductsID
join Person_Responsible on Person_Responsible.Person_responsibleID=Product_Coupons.Person_responsibleID 


