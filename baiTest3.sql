IF EXISTS (SELECT * FROM sys.databases WHERE Name='BookLibrary')
DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO
create table Book(
BookCode int primary key ,
BookTitle varchar(100) not null,
Author varchar(50) not null,
Edition int ,
BookPrice money,
Copies int
)
go
select*from Book
create table Member(
MemberCode int primary key,
Name varchar(50) not null,
Address varchar(100) not null,
PhoneNumber int 
)
go
select*from Member
create table IssueDetails(
BookCode int,
CONSTRAINT bc FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
MemberCode int,
CONSTRAINT mc FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
IssueDate datetime,
ReturnDate datetime
)
go

Alter table IssueDetails drop constraint mc
Alter table IssueDetails drop constraint bc

ALTER TABLE  Book DROP CONSTRAINT  PK__Book__0A5FFCC645D65A66
ALTER TABLE  Member DROP CONSTRAINT PK__Member__84CA637615CC3EBC

ALTER TABLE  Book ADD CONSTRAINT ms primary key (BookCode)
ALTER TABLE  Member ADD CONSTRAINT kt primary key (MemberCode)

ALTER TABLE IssueDetails ADD CONSTRAINT bc FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
ALTER TABLE IssueDetails ADD CONSTRAINT mc FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)

ALTER TABLE Book ADD CONSTRAINT Ck CHECK(BookPrice > 0 and BookPrice < 200000)

ALTER TABLE Member ADD CONSTRAINT pn UNIQUE (PhoneNumber)

ALTER TABLE IssueDetails
ALTER column BookCode int NOT NULL
ALTER TABLE IssueDetails
ALTER column MemberCode int NOT NULL

ALTER TABLE IssueDetails ADD PRIMARY KEY (BookCode,MemberCode)

INSERT INTO Book(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values (101,'Doraemon', 'Fujiko', 2,16000,2)
INSERT INTO Member(MemberCode,Name,Address,PhoneNumber) values (2003,'Thuy','HaNoi',0987312522)
INSERT INTO IssueDetails(BookCode, MemberCode, IssueDate, ReturnDate) values (101, 2003, '2022-06-05 00:00:00','2022-06-07 00:00:00')

SELECT * FROM Member
SELECT * FROM Book
SELECT * FROM IssueDetails