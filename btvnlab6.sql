create database ExerciseInformation

create table Student(
StudentNo int primary key,
StudentName varchar(50),
StudentAddress varchar(100),
PhoneNo int
)
create table Department(
DeptNo int primary key,
DeptName varchar(50),
ManagerName char(30)
)
create table Assignment(
AssignmentNo int primary key,
Description varchar(100)
)
create table Works_Assign(
JobID int primary key,
StudentNo int,
CONSTRAINT fk_StudentNo FOREIGN KEY (StudentNo)REFERENCES Student(StudentNo),
AssignmentNo int,
CONSTRAINT fk_AssignmentNo FOREIGN KEY (AssignmentNo)REFERENCES Assignment(AssignmentNo),
TotalHours int,
JobDetails XML
)
alter table Works_Assign drop constraint fk_StudentNo
alter table Student drop constraint PK__Student__32C4C02AA96EEB81
Drop index IX_Student on Student
CREATE  CLUSTERED INDEX IX_Studens on Student(StudentNo)

Alter table Student

add constraint PK__Student__32C4C02AA96EEB81

PRIMARY KEY(StudentNo)

alter table Works_Assign add CONSTRAINT fk_StudentNo FOREIGN KEY(StudentNo)REFERENCES Student(StudentNo)
CREATE  nonclustered  index IX_Dept on Department(DeptNo,DeptName,ManagerName)