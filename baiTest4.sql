
CREATE DATABASE informationSV
GO
USE informationSV
GO
create table information_student(
Name varchar(50),
age int,
DayOfBirth date
)

INSERT INTO information_student(Name,age,DayOfBirth) values ('Thuy',18,'20031213')
UPDATE  information_student set Name = 'Nguyen Thi Thuy' ,age = 19, DayOfBirth = '20021213' 
DELETE FROM information_student WHERE age= 19


ALTER TABLE information_student ADD studentID1 int not null;
ALTER TABLE information_student DROP COLUMN studentID

ALTER TABLE information_student ADD CONSTRAINT mk primary key (studentID1)
 
 create table classRoom (
classID int primary key,
 nameClass int 
 )

 ALTER TABLE classRoom ADD CONSTRAINT ml FOREIGN KEY(classID) REFERENCES information_student(StudentID1)

 INSERT INTO information_student(Name,age,DayOfBirth,studentID1) values ('Thuy',18,'20031213',2201003)
 INSERT INTO classRoom (classID,nameClass) values (2201003,2203)

 select*from information_student
 select*from classRoom