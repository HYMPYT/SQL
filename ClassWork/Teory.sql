--create database TestBase
--go
--use TestBase
--go
--create table Test
--(
--	Id int identity primary key,
--	Fname varchar(50),
--	Lname varchar(50),
--	Age int
--);
--go
--insert into Test
--values('Ivan', 'Ivanov', 23),
--('Petr','Ivanov',20),
--('Ivan','Petrov',31),
--('Petr','Petrov',42);
--go


--create view dbo.TestView (FirstName, LastName, Age) with schemabinding as
--select Fname, Lname, Age
--from dbo.Test
--go

--insert into TestView
--values('Stepan', 'Razin', 84);
--go
--select*
--from TestView