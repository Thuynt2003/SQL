create database Assignment_03
use Assignment_03

 create table Custumers(
 CustumerID nvarchar(30) primary key,
 CustumerName varchar(50),
 CCCD int,
 Address varchar(10)
 )
 create table Subscriber_Information(
 subscriberID nvarchar(20) primary key,
 subscriberNumber int,
 SubscriberType varchar(50),
 )
 create table Subscriber_Registration(
 Subscriber_RegistrationID nvarchar(20) primary key,
 CustumerID nvarchar(30),
 CONSTRAINT fk_CustumerID FOREIGN KEY (CustumerID)REFERENCES Custumers(CustumerID),
 subscriberID nvarchar(20) ,
 CONSTRAINT fk_subscriberID FOREIGN KEY (subscriberID)REFERENCES Subscriber_Information(subscriberID),
 RegistrationDate datetime
 )

 INSERT INTO Custumers(CustumerID,CustumerName,CCCD,Address) VALUES
 ('981047cb36ac','Nguyen Nguyet Nga',123456789,'Ha Noi'),
 ('39233c194535','Chau Ngoc Phuong',987654321,'TPHCM')

 INSERT INTO Subscriber_Information(subscriberID,subscriberNumber,SubscriberType ) VALUES
 ('756d6b529d47',123456789,'Tra truoc'),
 ('0866b32a',987654321,'tra sau')

 INSERT INTO Subscriber_Registration(Subscriber_RegistrationID,CustumerID,subscriberID,RegistrationDate) values
 ('ca63c2703e0a','981047cb36ac','756d6b529d47','20211201'),
 ('a6709ef5287c','981047cb36ac','0866b32a','20220301'),
 ('40a0e104','39233c194535','0866b32a','20190217'),
 ('b3cba2da0be4','39233c194535','756d6b529d47','20220416')
  --a) Hiển thị toàn bộ thông tin của các khách hàng của công ty.
 select *from Custumers
 --b) Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
 select *from Subscriber_Information
 --a) Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789
select *from Subscriber_Information where subscriberNumber = 0123456789
--b) Hiển thị thông tin về khách hàng có số CMTND: 123456789
select *from Custumers where CCCD = 123456789
--c) Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
select subscriberNumber from  Subscriber_Information 
join Subscriber_Registration on Subscriber_Information.subscriberID = Subscriber_Registration.subscriberID
join Custumers on Custumers.CustumerID= Subscriber_Registration.CustumerID where CCCD=123456789
--d) Liệt kê các thuê bao đăng ký vào ngày 19/02/17
select subscriberNumber from Subscriber_Information 
join Subscriber_Registration on Subscriber_Information.subscriberID = Subscriber_Registration.subscriberID where RegistrationDate ='20190217'
--e) Liệt kê các thuê bao có địa chỉ tại Hà Nội
select Custumers.CustumerName from Custumers where Custumers.Address='Ha Noi'
 --a) Tổng số khách hàng của công ty.
select count (Custumers.CustumerName) from Custumers
--b) Tổng số thuê bao của công ty.
select count(subscriberNumber) from Subscriber_Information 
--c) Tổng số thuê bào đăng ký ngày 19/02/17.
select count(subscriberID) from Subscriber_Registration where RegistrationDate ='20190217'
--d) Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
select*from Custumers join Subscriber_Registration on  Custumers.CustumerID= Subscriber_Registration.CustumerID
join Subscriber_Information on Subscriber_Information.subscriberID = Subscriber_Registration.subscriberID
--a) Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
ALTER TABLE Subscriber_Registration
ALTER COLUMN RegistrationDate  datetime  NOT NULL
--Đặt chỉ mục (Index) cho cột Tên khách hàng của bảng chứa thông tin khách hàng.
create index id_CustumerName on Custumers(CustumerName)
--View_KhachHang: Hiển thị các thông tin Mã khách hàng, Tên khách hàng, địa chỉ
create view v_Custumer as
select Custumers.CustumerID,Custumers.CustumerName,Custumers.Address from Custumers
--View_KhachHang_ThueBao: Hiển thị thông tin Mã khách hàng, Tên khách hàng, Số thuê bao
create view v_Custumer_Subscriber_Information as
select Custumers.CustumerID,CustumerName,subscriberNumber from Custumers 
join Subscriber_Registration on Custumers.CustumerID=Subscriber_Registration.CustumerID
join Subscriber_Information on Subscriber_Information.subscriberID = Subscriber_Registration.subscriberID
select*from v_Custumer_Subscriber_Information
--SP_TimKH_ThueBao: Hiển thị thông tin của khách hàng với số thuê bao nhập vào
create procedure sp_Custumers_subscriberNumber @subscriberNumber int
As
select*from Custumers 
join Subscriber_Registration on Custumers.CustumerID=Subscriber_Registration.CustumerID 
join Subscriber_Information on Subscriber_Information.subscriberID = Subscriber_Registration.subscriberID
where Subscriber_Information.subscriberNumber = @subscriberNumber 
Execute sp_Custumers_subscriberNumber @subscriberNumber = 987654321
--SP_TimTB_KhachHang: Liệt kê các số điện thoại của khách hàng theo tên truyền vào
create procedure sp_subscriberNumber_CustumerName @CustumerName varchar(50)
AS
select subscriberNumber from Subscriber_Information 
join Subscriber_Registration on Subscriber_Information.subscriberID=Subscriber_Registration.subscriberID
join Custumers on Custumers.CustumerID = Subscriber_Registration.CustumerID
where Custumers.CustumerName = @CustumerName
Execute sp_subscriberNumber_CustumerName @CustumerName ='Nguyen Nguyet Nga'


