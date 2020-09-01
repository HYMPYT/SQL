--create database Academy;
--go

--use Academy;
--go

--create table Departments
--(
--	Id int not null identity(1, 1) primary key,
--	Financing money not null check (Financing >= 0.0) default 0.0,
--	Name nvarchar(100) not null unique check (Name <> N''),
--	FacultyId int not null
--);
--go

--create table Faculties
--(
--	Id int not null identity(1, 1) primary key,
--	Name nvarchar(100) not null unique check (Name <> N'')
--);
--go

--create table Groups
--(
--	Id int not null identity(1, 1) primary key,
--	Name nvarchar(100) not null unique check (Name <> N''),
--	Year int not null check (Year between 1 and 5),
--	AmountOfStudents int not null,
--	DepartmentId int not null
--);
--go

--create table GroupsLectures
--(
--	Id int not null identity(1, 1) primary key,
--	DayOfWeek int not null check (DayOfWeek between 1 and 7),
--	GroupId int not null,
--	LectureId int not null
--);
--go

--create table Lectures
--(
--	Id int not null identity(1, 1) primary key,
--	LectureRoom nvarchar(max) not null check (LectureRoom <> N''),
--	SubjectId int not null,
--	TeacherId int not null
--);
--go

--create table Subjects
--(
--	Id int not null identity(1, 1) primary key,
--	Name nvarchar(100) not null unique check (Name <> N'')
--);
--go

--create table Teachers
--(
--	Id int not null identity(1, 1) primary key,
--	Name nvarchar(max) not null check (Name <> N''),
--	Salary money not null check (Salary > 0.0),
--	Surname nvarchar(max) not null check (Surname <> N'')
--);
--go

--alter table Departments
--add foreign key (FacultyId) references Faculties(Id);
--go

--alter table Groups
--add foreign key (DepartmentId) references Departments(Id);
--go

--alter table GroupsLectures
--add foreign key (GroupId) references Groups(Id);
--go

--alter table GroupsLectures
--add foreign key (LectureId) references Lectures(Id);
--go

--alter table Lectures
--add foreign key (SubjectId) references Subjects(Id);
--go

--alter table Lectures
--add foreign key (TeacherId) references Teachers(Id);
--go

--insert into Faculties(Name)
--values ('Computer Science'),
--('Applied Mathematics'),
--('Biochemical'),
--('Radio engineering');
--go

--insert into Departments(Financing, Name, FacultyId)
--values(23000,'Software Development',1),
--(18000,'Department of Mathematics',2),
--(20000,'Engineering',4),
--(15000,'Biology',3);
--go

--insert into Groups(Name, Year, AmountOfStudents, DepartmentId)
--values('KV-83', 2, 23, 1),
--('KP-72', 3, 20, 2),
--('IS-63', 4, 18, 4),
--('OP-51', 5, 26, 3);
--go

--insert into Subjects(Name)
--values('Programming'),
--('Maths'),
--('Physics');
--go

--insert into Teachers(Name, Salary, Surname)
--values('Jack',2300,'Underhill'),
--('Dave',3400,'McQueen'),
--('Mark',3500,'Chill');
--go

--insert into Lectures(LectureRoom, TeacherId, SubjectId)
--values('D201', 3, 1),
--('B302', 1, 3),
--('C123', 2, 2),
--('D201', 1, 3),
--('B302', 2, 2),
--('C123', 3, 1);
--go

--insert into GroupsLectures(DayOfWeek, GroupId, LectureId)
--values(1,3,1),
--(2,4,2),
--(3,1,3),
--(4,2,2),
--(5,4,3);
--go
use Academy
--1 Вывести количество преподавателей кафедры “Software Development”.
--select count(Teachers.Name) as 'Kоличество преподавателей'
--from Departments join Groups on Departments.Id = Groups.DepartmentId join GroupsLectures on Groups.Id = GroupsLectures.GroupId
--join Lectures on GroupsLectures.LectureId = Lectures.Id join Teachers on Lectures.TeacherId = Teachers.Id
--where Departments.Name = 'Software Development'

--2 Вывести количество лекций, которые читает преподаватель “Dave McQueen”.
--select count(Lectures.LectureRoom)as'Kоличество лекций'
--from Lectures join Teachers on Lectures.TeacherId = Teachers.Id
--where Teachers.Name = 'Dave' and Teachers.Surname = 'McQueen'

--3 Вывести количество занятий, проводимых в аудитории “D201”.
--select count(Name) as 'Kоличество занятий в аудитории D201'
--from Lectures join Subjects on Lectures.SubjectId = Subjects.Id
--where Lectures.LectureRoom = 'D201'

--4 Вывести названия аудиторий и количество лекций, проводимых в них.
--select Lectures.LectureRoom as 'Название аудитории', count(Name) as 'Kоличество лекций'
--from Lectures join Subjects on Lectures.SubjectId = Subjects.Id
--group by Lectures.LectureRoom;

--5 Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.
--select sum(Groups.AmountOfStudents) as 'Количество студентов'
--from Groups join GroupsLectures on Groups.Id = GroupsLectures.GroupId join Lectures on Lectures.Id = GroupsLectures.LectureId join Teachers on Teachers.Id = Lectures.TeacherId
--where Teachers.Name = 'Jack' and Teachers.Surname = 'Underhill'

--6 Вывести среднюю ставку преподавателей факультета “Computer Science”.
--select avg(Teachers.Salary) as 'Средняя ставка преподавателей'
--from Faculties join Departments on Faculties.Id = Departments.FacultyId join Groups on Groups.Id = Groups.DepartmentId
--join GroupsLectures on Groups.Id = GroupsLectures.GroupId join Lectures on Lectures.Id = GroupsLectures.LectureId
--join Teachers on Teachers.Id = Lectures.TeacherId
--where Faculties.Name = 'Computer Science'

--7 Вывести минимальное и максимальное количество студентов среди всех групп.
--select min(Groups.AmountOfStudents) as 'Минимальное количество студентов', max(Groups.AmountOfStudents) as 'Максимальное количество студентов'
--from Groups

--8 Вывести средний фонд финансирования кафедр.
--select avg(Departments.Financing)as'Cредний фонд финансирования кафедр'
--from Departments

--9 Вывести полные имена преподавателей и количество читаемых ими дисциплин.
--select Teachers.Name + ' ' + Teachers.Surname as 'Имя Фамилия', count(distinct Subjects.Name) as 'Kоличество читаемых ими дисциплин'
--from Teachers join Lectures on Teachers.Id = Lectures.TeacherId join Subjects on Lectures.SubjectId = Subjects.Id
--group by Teachers.Name, Teachers.Surname

--10 Вывести количество лекций в каждый день недели.
--select GroupsLectures.DayOfWeek as 'День недели', count(Lectures.LectureRoom) as 'Kоличество лекций'
--from GroupsLectures join Lectures on GroupsLectures.LectureId = Lectures.Id
--group by GroupsLectures.DayOfWeek

--11 Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.
--select Lectures.LectureRoom as 'Номер аудитории', count(distinct Departments.Name) as 'Kоличество кафедр'
--from Departments join Groups on Departments.Id = Groups.DepartmentId join GroupsLectures on Groups.Id = GroupsLectures.GroupId
--join Lectures on Lectures.Id = GroupsLectures.LectureId
--group by Lectures.LectureRoom

--12 Вывести названия факультетов и количество дисциплин, которые на них читаются.
--select Faculties.Name as 'Название факультета', count(distinct Subjects.Name) as 'Kоличество дисциплин'
--from Faculties join Departments on Faculties.Id = Departments.FacultyId join Groups on Groups.DepartmentId = Departments.Id
--join GroupsLectures on Groups.Id = GroupsLectures.GroupId join Lectures on GroupsLectures.LectureId = Lectures.Id
--join Subjects on Lectures.SubjectId = Subjects.Id
--group by Faculties.Name

--13 Вывести количество лекций для каждой пары преподаватель-аудитория.
--select Teachers.Name + ' - ' + Lectures.LectureRoom as 'Преподаватель-аудитория', count(Subjects.Name) as 'Kоличество лекций'
--from Subjects join Lectures on Subjects.Id = Lectures.SubjectId join Teachers on Lectures.TeacherId = Teachers.Id
--group by Teachers.Name, Lectures.LectureRoom