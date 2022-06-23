create database Aptech

create table Classes(
ClassName nvarchar(6),
Teacher varchar(30),
TimeSlot nvarchar(30),
Class int,
Lab int
)


CREATE UNIQUE CLUSTERED INDEX MyClustered ON Classes(ClassName) with (Pad_index = on,FillFactor = 70, Ignore_Dup_Key = on)
 create nonclustered index TeacherIndex on Classes(Teacher)

 Drop index TeacherIndex on Classes

ALTER index MyClustered on Classes REBUILD With (ALLOW_ROW_LOCKS = on,ALLOW_PAGE_LOCKS= ON,MAXDOP = 2)
 CREATE INDEX ClassLabIndex ON Classes (Class,Lab)
EXEC sp_helpindex 'Classes'

