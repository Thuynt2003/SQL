create database Assignment_05
 use Assignment_05

 create table ContactInfo (
 ContactInfoID nvarchar(30) primary key ,
 ContactInfozName varchar(30),
 BirthDay datetime,
 Address nvarchar(30)
 )
 

 create table PhoneNumber(
 PhoneNumberID nvarchar(30) primary key,
 PhoneNumber varchar(30)
 )
 create table Phone_List(
 Phone_ListID nvarchar(30) primary key,
 ContactInfoID nvarchar(30),
 CONSTRAINT fk_ContactInfoID FOREIGN KEY (ContactInfoID)REFERENCES ContactInfo(ContactInfoID),
 PhoneNumberID nvarchar(30),
 CONSTRAINT fk_PhoneNumberID FOREIGN KEY (PhoneNumberID)REFERENCES PhoneNumber(PhoneNumberID),
 )
 select *from Phone_List 
 insert into ContactInfo(ContactInfoID,ContactInfozName,BirthDay,Address)values
 ('34da68c4-a5a6-4150-82a1','Nguyen Van An','11-18-1987',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội'),
 ('78f52caf-d943-4834-8f90','Hoang Tu Anh','12-12-2009',N'908 Truong Duong'),
 ('4f26ef1e-bfab-43f1-8157','Nguyen Khanh Ngoc','12-05-2009',N'507 Dinh Tien Hoang'),
 ('0ec08a95-2416-4d5f-a6f2','Chau Ngoc Phuong','12-28-2005',N'722 Mai Xuan Thuong'),
 ('071f482d-d06a-4406-9838','Mai Kieu Oanh','12-12-2009',N'456 Nguyen Cong Tru')

 insert into PhoneNumber(PhoneNumberID,PhoneNumber)values
 ('a343c5ae-35cc-4677','987654321'),
 ('ddca14e7-8383-4aec','9873452'),
 ('92390070-0204-44e5','9832323'),
 ('b173c1d5-5296-4ec','9434343'),
 ('264ab6c4-9df9-4a34','123456789'),
 ('82b8aaba-0e8a-4f4c','234567189'),
 ('3ce5eb23-120e-48a9','456712378'),
 ('ee3551e4-40d8-4f10','671237845'),
 ('6d2e5155-25aa-49e4','237846715'),
 ('86106d8a-9472-4e43','784671235'),
 ('12d738f5-84b9-4bc9','123597846'),
 ('9feb8e12-7a69-464c','3597812467')

 insert into Phone_List(Phone_ListID,ContactInfoID,PhoneNumberID)values
 ('fd55fae1-e0fc-46cf-90cb','34da68c4-a5a6-4150-82a1','a343c5ae-35cc-4677'),
 ('baec9102-66a1-419e-ab80','34da68c4-a5a6-4150-82a1','ddca14e7-8383-4aec'),
 ('de3a5094-ea78-4963-a41b','34da68c4-a5a6-4150-82a1','92390070-0204-44e5'),
 ('91d98eb7-06ab-494a-bc62','34da68c4-a5a6-4150-82a1','b173c1d5-5296-4ec'),
 ('fa103aa9-24f2-45c3-ba45','78f52caf-d943-4834-8f90','264ab6c4-9df9-4a34'),
 ('50657de4-1f5e-4716-96ec','78f52caf-d943-4834-8f90','82b8aaba-0e8a-4f4c'),
 ('11a4c5dc-b3ae-4ff1-abfd','4f26ef1e-bfab-43f1-8157','3ce5eb23-120e-48a9'),
 ('b2fd8b45-ef42-43aa-a801','4f26ef1e-bfab-43f1-8157','ee3551e4-40d8-4f10'),
 ('24b4cf50-cc29-40c0-a2c6','0ec08a95-2416-4d5f-a6f2','6d2e5155-25aa-49e4'),
 ('83d659d4-1a9f-4b5e-af39','0ec08a95-2416-4d5f-a6f2','86106d8a-9472-4e43'),
 ('fc59931c-2d33-46b8-a143','0ec08a95-2416-4d5f-a6f2','12d738f5-84b9-4bc9'),
 ('98fc4fbb-cb79-4f73-9e0b','071f482d-d06a-4406-9838','9feb8e12-7a69-464c')

 --Liệt kê danh sách những người trong danh bạ
 select ContactInfo.ContactInfozName from ContactInfo
 --Liệt kê danh sách số điện thoại có trong danh bạ
 select PhoneNumber.PhoneNumber from PhoneNumber
 --Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
 select ContactInfo.ContactInfozName from ContactInfo order by ContactInfozName
 --Liệt kê các số điện thoại của người có tên là Nguyễn Văn An.
 select PhoneNumber.PhoneNumber from PhoneNumber 
 join Phone_List on PhoneNumber.PhoneNumberID =Phone_List.PhoneNumberID
 join ContactInfo on ContactInfo.ContactInfoID =Phone_List.ContactInfoID where ContactInfo.ContactInfozName ='Nguyen Van An' 
 --Liệt kê những người có ngày sinh là 12/12/09
 select ContactInfo.ContactInfozName from ContactInfo where ContactInfo.BirthDay = '12-12-2009'
  select ContactInfo.ContactInfozName ,Count (PhoneNumber.PhoneNumber ) as 'PhoneNumber' from ContactInfo
  join Phone_List on ContactInfo.ContactInfoID =Phone_List.ContactInfoID 
  join PhoneNumber on PhoneNumber.PhoneNumberID =Phone_List.PhoneNumberID 
  group by ContactInfo.ContactInfozName
  --Tìm tổng số người trong danh bạ sinh vào thang 12.
  select count(ContactInfo.ContactInfozName) as Total from ContactInfo where FORMAT(ContactInfo.BirthDay, 'MM') = 12
  --Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
  select 