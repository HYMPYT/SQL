--create database Academy;
--go

--use Academy;

--create table Departments
--(
--	Id int not null identity(1, 1) primary key,
--	Financing money not null check (Financing >= 0.0),
--	Name nvarchar(100) not null unique check (Name <> N'')
--);
--create table Faculties
--(
--	Id int not null identity(1, 1) primary key,
--	Dean nvarchar(max) not null check (Dean <> N''),
--	Name nvarchar(100) not null unique check (Name <> N''),
--);
--create table Groups
--(
--	Id int not null identity(1, 1) primary key,
--	Name nvarchar(10) not null unique check (Name <> N''),
--	Rating float not null check (Rating between 0 and 5),
--	Year int not null check (Year between 1 and 5)
--);
--create table Teachers
--(
--	Id int not null identity(1, 1) primary key,
--	EmploymentDate date not null check (EmploymentDate >= '01-01-1990'),
--	IsAssistant bit not null default 0,
--	IsProfessor bit not null default 0,
--	Name nvarchar(max) not null check (Name <> N''),
--	Position nvarchar(max) not null check (Position <> N''),
--	Premium money not null check (Premium >= 0.0) default 0.0,
--	Salary money not null check (Salary > 0.0),
--	Surname nvarchar(max) not null check (Surname <> N'')
--);

--insert into Departments(Financing, Name)
--values(9000, 'FBMI'),
--(10000, 'IAT'),
--(26000, 'SPSCS'),
--(15000, 'Software Development'),
--(7000, 'KTPU');
--insert into Faculties(Dean, Name)
--values('Ruslan Vladimirovich', 'Faculty of Radio Engineering'),
--('Ivan Andreevich', 'Applied Mathematics'),
--('Grigory Semenovich', 'Computer Science'),
--('Evgeny Nikolaevich', 'Software Development'),
--('Anatoly Anatolievich', 'Sociology and Law');
--insert into Groups(Name, Rating, Year)
--values('KV83', 2.4, 2),
--('KP51', 3.4, 5),
--('IP72', 5, 3),
--('IS64', 1.2, 4),
--('KM71', 3.6, 3);
--insert into Teachers(EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname)
--values('1990-01-02', 0, 1, 'Aleri', 'Physicist', 400, 8000, 'Levchenko'),
--('2001-01-01', 1, 0, 'Alexander', 'Mathematician', 150, 7500, 'Gavrish'),
--('2012-03-21', 1, 0, 'Sergey Konstantinovich', 'Chemist', 200, 8500, 'Dugan'),
--('1998-12-12', 0, 0, 'Peter Ivanovich', 'Designer', 100, 5000, 'Astralin'),
--('2000-08-15', 0, 1, 'Natalya Semenovna', 'Computer scientist', 600, 11000, 'Saenko');

use Academy
--1
--select Name, Financing, Id
--from Departments

--2
--select Name as 'Group Name', Rating as 'Group Rating'
--from Groups

--3
--select Surname, ((Salary/Premium)*100) as ' % Ê ÑÒÀÂÊÅ', ((Salary/(Salary + Premium))*100) as ' % Ê ÇÀÐÏËÀÒÅ'
--from Teachers

--4
--select 'The dean of faculty' as ' ', Name, 'is' as ' ', Dean
--from Faculties

--5
--select Surname
--from Teachers
--where (IsProfessor = 1 and Salary >= 1050)

--6
--select Name
--from Departments
--where (Financing < 11000 or Financing > 25000)

--7
--select Name
--from Faculties
--where Name != 'Computer Science'

--8
--select Surname, Position
--from Teachers
--where IsProfessor = 0

--9
--select Surname, Position, Salary, Premium
--from Teachers
--where (IsAssistant = 1 and Premium between 160 and 550)

--10
--select Surname, Salary
--from Teachers
--where IsAssistant = 1

--11
--select Surname, Position
--from Teachers
--where EmploymentDate < '01-01-2000'

--12
--select Name as 'Name of Department'
--from Departments
--where Name != 'Software Development' 
--order by Name 

--13
--select Surname
--from Teachers
--where (IsAssistant = 1 and (Salary + Premium) !> 1200)

--14
--select Name
--from Groups
--where (Year = 5 and Rating between 2 and 4)

--15
--select Surname
--from Teachers
--where (IsAssistant = 1 and (Salary < 550 or Premium < 200))