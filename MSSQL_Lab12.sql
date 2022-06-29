﻿create database MSSQL_Lab12

 use MSSQL_Lab12

create table Employee(
 EmployeeID nvarchar(30) primary key ,
 Name varchar(100),
 Tel char(11),
 Email varchar(30)
 )

 create table Project(
 ProjectID nvarchar(30) primary key ,
 ProjectName varchar(30),
 StartDate datetime,
 EndDate datetime,
 Period int ,
 Cost money 
 )

create table Groups(
 GroupID nvarchar(30) primary key ,
 GroupName varchar(30),
 LeaderID nvarchar(30) ,
 constraint fk_LeaderID foreign key (LeaderID)references Employee(EmployeeID),
 ProjectID nvarchar(30),
 constraint fk_ProjectID foreign key (ProjectID)references Project(ProjectID),
)

create table GroupDetail(
 GroupID nvarchar(30),
 constraint fk_GroupID foreign key (GroupID)references Groups(GroupID),
 EmployeeID nvarchar(30),
 constraint fk_EmployeeID foreign key (EmployeeID)references Employee(EmployeeID),
 Status char(20)
)
drop table Employee
drop table Project
drop table Groups
drop table GroupDetail
insert into Employee(EmployeeID,Name,Tel,Email)values
 ('TH2201003','Nguyen Thi Thuy','0987312522','THUYNTTH2201003@FPT.EDU.VN'),
 ('TH2202013','Nguyen Trung Hieu','0976534218','HIEUNTTH2202013@FPT.EDU.VN'),
 ('TH2202041','Nguyen Đinh Hien','0578645231','HIENNDTH2202041@FPT.EDU.VN'),
 ('TH2202015','Tong Minh Duong','0967543218','DUONGTMTH2202015@FPT.EDU.VN'),
 ('TH2202014','Truong Cong Tuan','0254671832','TUANTCTH2202014@FPT.EDU.VN'),
 ('TH2202039','Nguyen Van Tien','0656784321','TIENNVTH2202039@FPT.EDU.VN'),
 ('TH2202003','Đao Trong Quyet','0387654321','QUYETDTTH2202003@FPT.EDU.VN'),
 ('TH2202044','Nhu Tien Quyen','0956743223','QUYENNTTH2202044@FPT.EDU.VN'),
 ('TH2202040','Nguyen Xuan Hanh','0953214534','HANHNXTH2202040@FPT.EDU.VN'),
 ('TH2202027','Đo Đuc Manh','0953467889','MANHDDTH2202027@FPT.EDU.VN'),
 ('TH2202025','Tran Tuan Vu','0165432178','VUTTTH2202025@FPT.EDU.VN'),
 ('TH2202007','Mai Xuan Tien','0834215678','TIENMXTH2202007@FPT.EDU.VN'),
 ('TH2202034','Vu Duy Khanh','0956432178','KHANHVDTH2202034@FPT.EDU.VN'),
 ('TH2203008','Nguyen Thai Duong','0981726354','DUONGNTTH2203008@FPT.EDU.VN'),
 ('TH2203007','Nguyen Huu Thinh','0218273645','THINHNHTH2203007@FPT.EDU.VN'),
 ('TH2201005','Nguyen Ba Quoc','0369521634','QUOCNBTH2201005@FPT.EDU.VN')

 insert into Project(ProjectID,ProjectName,StartDate,EndDate,Cost) values
 ('TCP01','Du an Hop tac Ky thuat','12-10-2011','12-10-2021',230000000),
 ('ODA02','Du an Hop tac von vay','11-18-1987','11-18-2000',340000000),
 ('GA03',' Du an Vien tro khong hoan lai','05-12-2022','12-12-2024',140000000),
 ('CPDT04','Chinh phu dien tu','10-12-2023','10-12-2026',160000000)

 insert into Groups(GroupID,GroupName,LeaderID,ProjectID)values
 ('Groups1','Nhom1','TH2202041','TCP01'),
 ('Groups2','Nhom2','TH2202003','GA03'),
 ('Groups3','Nhom3','TH2202007','ODA02'),
 ('Groups4','Nhom4','TH2202034','CPDT04')

  insert into GroupDetail(GroupID,EmployeeID,Status) values
  ('Groups1','TH2201003','Da lam'),
  ('Groups1','TH2202013','Da lam'),
  ('Groups1','TH2202041','Da lam'),
  ('Groups1','TH2202015','Da lam'),
  ('Groups2','TH2202014','Dang lam'),
  ('Groups2','TH2202039','Dang lam'),
  ('Groups2','TH2202003','Dang lam'),
  ('Groups2','TH2202044','Dang lam'),
  ('Groups3','TH2202040','Da lam'),
  ('Groups3','TH2202027','Da lam'),
  ('Groups3','TH2202025','Da lam'),
  ('Groups3','TH2202007','Da lam'),
  ('Groups4','TH2202034','Sap lam'),
  ('Groups4','TH2203008','Sap lam'),
  ('Groups4','TH2203007','Sap lam')
 
  --Xác định thuộc tính khóa (khóa chính, khóa ngoại) và viết câu lệnh thay đổi các trường với thuộc tính khóa vừa xác định.

  SELECT * FROM information_schema.key_column_usage
  
  -- Thêm dữ liệu cho các bảng

  --Hiển thị thông tin của tất cả nhân viên

  select *from Employee 

  --Liệt kê danh sách nhân viên đang làm dự án “Chính phủ điện tử”

