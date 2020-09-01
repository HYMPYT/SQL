--create database Barbershop
--go
--use Barbershop
--go
--create table Barbers
--(
--	Id int not null identity(1,1) primary key,
--	First_name nvarchar(50) not null check(First_name <> N''),
--	Second_name nvarchar(50) not null check(Second_name <> N''),
--	Last_name nvarchar(50) not null check(Last_name <> N''),
--	Phone nvarchar(20) not null check(Phone <> N''),
--	Email nvarchar(30) not null check(Email <> N''),
--	Sex nvarchar(10) not null check(Sex <> N''),
--	Birthday nvarchar(30) not null check(Birthday <> N''),
--	Admission date not null,
--	Position nvarchar(50) not null check(Position <> N''),
--	ServiceId int not null,
--	FeedbackId int not null,
--	RatingId int not null
--);
--go
--create table Schedule
--(
--	Id int not null identity(1,1) primary key,
--	First_date date not null,
--	First_time time not null,
--	Last_date date not null,
--	Last_time time not null,
--	RecordId int not null
--);
--go
--create table Customers
--(
--	Id int not null identity(1,1) primary key,
--	First_name nvarchar(50) not null check(First_name <> N''),
--	Second_name nvarchar(50) not null check(Second_name <> N''),
--	Last_name nvarchar(50) not null check(Last_name <> N''),
--	Phone nvarchar(20) not null check(Phone <> N''),
--	Email nvarchar(30) not null check(Email <> N''),
--	FeedbackId int not null,
--	RatingId int not null
--);
--go
--create table Archive
--(
--	Id int not null identity(1,1) primary key,
--	DataRecord date not null,
--	Sale money not null check(Sale >= 0),
--	BarberId int not null,
--	CustomerId int not null,
--	ServiceId int not null,
--	FeedbackId int not null,
--	RatingId int not null
--);
--go
--create table Services
--(
--	Id int not null identity(1,1) primary key,
--	Service nvarchar(50) not null check(Service <> N''),
--	Sale money not null,
--	TimeService time not null
--);
--go
--create table Feedbacks
--(
--	Id int not null identity(1,1) primary key,
--	Feedback nvarchar(255) not null check(Feedback <> N'')
--);
--go
--create table Ratings
--(
--	Id int not null identity(1,1) primary key,
--	RatingType nvarchar(20) not null check(RatingType <> N'')
--);
--go
--create table Records
--(
--	Id int not null identity(1,1) primary key,
--	RecordDate date not null,
--	RecordTime time not null,
--	CustomerId int not null
--);
--go

--alter table Barbers
--add foreign key(ServiceId) references Services(Id);
--go

--alter table Barbers
--add foreign key(FeedbackId) references Feedbacks(Id);
--go

--alter table Barbers
--add foreign key(RatingId) references Ratings(Id);
--go

--alter table Schedule
--add foreign key(RecordId) references Records(Id);
--go

--alter table Customers
--add foreign key(FeedbackId) references Feedbacks(Id);
--go

--alter table Customers
--add foreign key(RatingId) references Ratings(Id);
--go

--alter table Archive
--add foreign key(BarberId) references Barbers(Id);
--go

--alter table Archive
--add foreign key(CustomerId) references Customers(Id);
--go

--alter table Archive
--add foreign key(ServiceId) references Services(Id);
--go

--alter table Archive
--add foreign key(FeedbackId) references Feedbacks(Id);
--go

--alter table Archive
--add foreign key(RatingId) references Ratings(Id);
--go

--alter table Records
--add foreign key(CustomerId) references Customers(Id);
--go

--insert into Services(Service, Sale, TimeService)
--values
--('Haircut', 200, '00:30:00'),
--('Beard Haircut', 250, '00:45:00'),
--('Styling', 100, '01:00:00'),
--('Haircut Mustache', 175, '00:25:00'),
--('Booze', 40, '00:03:00');
--go

--insert into Feedbacks(Feedback)
--values
--('Services at an altitude'),
--('Poor customer service'),
--('I liked everything and especially the new barber approach'),
--('The establishment is not bad enough');
--go

--insert into Ratings(RatingType)
--values
--('*'),
--('**'),
--('***'),
--('****'),
--('*****');
--go

--insert into Barbers(First_name, Second_name, Last_name, Phone, Email, Sex, Birthday, Admission, Position, ServiceId, FeedbackId, RatingId)
--values
--('Wre', 'Wreddy', 'Wredi', '8321292274', 'ine@gfk.com', 'M', '1990-12-23', '2012-02-08', 'Signor Barber', 1, 2, 1),
--('Qartha', 'Qaster', 'Qba', '0947290502', 'inerk@gfk.com', 'M', '1998-04-26', '2012-06-06', 'Junior Barber', 3, 1, 3),
--('Dre', 'Dreddy', 'Dredi', '3572325323', 'yry@tet.otg', 'M', '2000-06-15', '2019-10-24', 'Junior Barber', 4, 1, 2),
--('Qfwq', 'Wntb', 'Wirnv', '4768465231', 'exr@24gd.ua', 'M', '1996-08-19', '2013-03-12', 'Signor Barber', 2, 4, 4),
--('Wtmt', 'Cwrwrw', 'Vwrqq', '4485685621', 'uecc@gmail.com', 'M', '1992-05-06', '2006-03-07', 'Chef Barber', 5, 3, 5);
--go

--insert into Customers(First_name, Second_name, Last_name, Phone, Email, FeedbackId, RatingId)
--values
--('Werr', 'Wredit', 'Wredc', '3253253822', 'evvev@ukr.net', 1, 2),
--('Drecy', 'Csax', 'Vect', '0547792342', 'vdvq@gmail.com', 2, 3),
--('Bred', 'Drodo', 'Brodovuch', '6891529433', 'crev@mail.ru', 3, 1),
--('Verc', 'Vreds', 'Csaw', '6471891912', 'cdnvr@mail.ru', 1, 4),
--('Kerd', 'Kerds', 'Csaqw', '4309569223', 'vkry2332@gmail.com', 4, 5);
--go

--insert into Records(RecordDate, RecordTime, CustomerId)
--values
--('2019-09-14', '10:20:00', 1),
--('2019-10-14', '10:20:00', 1),
--('2019-10-25', '15:30:00', 2),
--('2019-11-16', '12:15:00', 3),
--('2019-09-25', '15:30:00', 2),
--('2019-08-20', '10:30:00', 2),
--('2019-12-10', '17:25:00', 4),
--('2020-01-20', '14:55:00', 5);
--go

--insert into Schedule(First_date, First_time, Last_date, Last_time, RecordId)
--values
--('2019-09-13', '09:00:00', '2019-09-20', '17:00:00', 1),
--('2019-10-19', '10:00:00', '2019-10-29', '18:00:00', 2),
--('2019-11-12', '09:30:00', '2019-11-22', '14:30:00', 3),
--('2019-12-09', '11:00:00', '2019-12-19', '16:00:00', 4),
--('2020-01-15', '09:45:00', '2020-01-25', '17:50:00', 5);
--go

--insert into Archive(DataRecord, Sale, BarberId, CustomerId, ServiceId, FeedbackId, RatingId)
--values
--('2019-09-14', 200, 1, 1, 1, 3, 2),
--('2019-09-14', 250, 1, 1, 2, 3, 5),
--('2019-09-14', 100, 1, 1, 3, 3, 4),
--('2019-10-25', 250, 4, 2, 2, 2, 3),
--('2019-11-16', 100, 2, 3, 3, 1, 2),
--('2019-12-10', 175, 3, 4, 4, 4, 4),
--('2020-01-20', 40, 5, 5, 5, 4, 5);
--go

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~Task 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--1======================================
--create procedure sp_barber_info
--as
--begin
--	select top(1)First_name, Second_name, Last_name, Phone, Email, Sex, Birthday, Admission, Position
--	from Barbers
--	order by Admission
--end

--exec sp_barber_info

--2=======================================



--3=======================================
--create procedure sp_info_max_visiting
--as
--begin
--	declare @id int
--	declare @Zvit table(Id int, amount int)
--	insert @Zvit
--		select Records.CustomerId as 'Customer', count(Records.CustomerId) as 'Amount'
--		from Records
--		group by Records.CustomerId

--	select @id = z.Id
--	from @Zvit z
--	where z.amount = (select max(amount) from @Zvit)

--	select First_name, Second_name, Last_name, Phone, Email
--	from Customers
--	where @id = Customers.Id
--end

--exec sp_info_max_visiting

--4=======================================
--create procedure sp_info_max_sum
--as
--begin
--	declare @id int
--	declare @Zvit table (Id int, MaxSum money)
--	insert @Zvit
--		select Archive.CustomerId, sum(Archive.Sale)
--		from Archive
--		group by Archive.CustomerId

--	select @id = z.Id
--	from @Zvit z
--	where z.MaxSum = (select max(MaxSum) from @Zvit)

--	select First_name, Second_name, Last_name, Phone, Email, sum(Sale) as 'Sale'
--	from Customers join Archive on Archive.CustomerId = Customers.Id
--	where Customers.Id = @id
--	group by First_name, Second_name, Last_name, Phone, Email
--end

--exec sp_info_max_sum

--5=======================================
--create procedure sp_info_service
--as
--begin
--	select top(1)Service, Sale, TimeService
--	from Services
--	order by Services.TimeService desc
--end

--exec sp_info_service