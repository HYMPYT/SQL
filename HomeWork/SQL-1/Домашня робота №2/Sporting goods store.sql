--create database SportingGoodsStore
--go
--use SportingGoodsStore
--go

--create table Products
--(
--	Id int identity(1, 1) not null primary key,
--	Name nvarchar(100) not null check(Name <> N''),
--	Type nvarchar(100) not null check(Type <> N''),
--	Availability int not null,
--	SelfPrice money,
--	SalePrice money,
--	MakerName nvarchar(100) not null check(MakerName <> N'')
--)
--go
--create table Sales
--(
--	Id int identity(1, 1) not null primary key,
--	Price money not null,
--	Sold int not null,
--	Date Date,
--	SalerNameId int not null,
--	BuyerId int not null,
--	ProductId int not null
--)
--go
--create  table  Workers
--(
--	Id int identity(1, 1) not null primary key,
--	Position nvarchar(100) not null check(Position <> N''),
--	FirstName nvarchar(255) not null check(FirstName <> N''),
--	SecondName nvarchar(255) not null check(SecondName <> N''),
--	LastName nvarchar(255) not null check(LastName <> N''),
--	Admission Date not null,
--	Sex nvarchar(10) not null check(Sex <> N''),
--	Salery money,
--)
--go
--create table Buyers
--(
--	Id int identity(1, 1) not null primary key,
--	FirstName nvarchar(255) not null check(FirstName <> N''),
--	SecondName nvarchar(255) not null check(SecondName <> N''),
--	LastName nvarchar(255) not null check(LastName <> N''),
--	Registration date not null,
--	Email nvarchar(255) not null unique check(Email <> N''),
--	Phone nvarchar(255) not null unique check(Phone <> N''),
--	Sex nvarchar(10) not null check(Sex <> N''),
--	Discounts int not null,
--	Spam bit not null, 
--)
--go

--alter table Sales
--add foreign key(SalerNameId) references Workers(Id) on delete cascade;
--go

--alter table Sales
--add foreign key(BuyerId) references Buyers(Id) on delete cascade;
--go

--alter table Sales
--add foreign key(ProductId) references Products(Id);
--go

--insert into Products(Name, Type, Availability, SelfPrice, SalePrice, MakerName)
--values
--('Snack','Food', 1, 1552, 509590, 'UnderArmor'),
--('Protein shake','Drink', 1, 14, 37, 'USA'),
--('Dumbbells','Sport equipment', 0, 122, 240, 'China'),
--('Snikers','Food', 1, 1552, 48040, 'Germany');
--go

--insert into Workers(Position, FirstName, SecondName, LastName, Admission, Sex, Salery)
--values
--('Seller', 'Adeline', 'Adella', 'Adelle', '2012-02-08', 'F', 10000),
--('Manager', 'Dre', 'Dreddy', 'Dredi', '2012-06-06', 'M', 15000),
--('Sommelier', 'Eartha', 'Easter', 'Eba', '2006-03-07', 'F', 12000),
--('Seller', 'Rloe', 'Rloris', 'Rlotilda', '2009-06-12', 'F', 11000);
--go

--insert into Buyers(FirstName, SecondName, LastName, Registration, Email, Phone, Sex, Discounts, Spam)
--values
--('Cloe', 'Cloris', 'Clotilda', '2013-03-12', 'ine@gfk.com', '9576264745', 'F', 20, 1),
--('Mdeline', 'Mdella', 'Mdelle', '2006-08-24', 'inerk@gfk.com', '0272359053', 'F', 10, 1),
--('Wre', 'Wreddy', 'Wredi', '2007-04-15', 'yry@tet.otg', '1256354435', 'M', 15, 0),
--('Qartha', 'Qaster', 'Qba', '2019-10-24', 'exr@24gd.ua', '5743762437', 'M', 30, 1);
--go

--insert into Sales(Price, Sold, Date, SalerNameId, BuyerId, ProductId)
--values
--( 25.99, 36, '2006-05-02', 1, 2, 1),
--( 794.99, 696, '2016-12-13', 2, 3, 2),
--( 2523.99, 36436, '2009-05-03', 3, 1, 3),
--( 25.99, 36, '2017-10-21', 4, 4, 4);
--go

--1============================================
--create trigger add_product
--on Products after insert
--as
--begin
--	declare @name nvarchar(25), @type nvarchar(30), @self_price money, @sale_price money, @maker_name nvarchar(30), @amount int = -1, @amount_ins int
--	select @name = Name, @amount_ins = Availability, @type = Type, @self_price = SelfPrice, @sale_price = SalePrice, @maker_name = MakerName
--	from inserted
	
--	select @amount = Products.Availability
--	from Products
--	where @name = Products.Name and @type = Products.Type and @self_price = Products.SelfPrice and @sale_price = Products.SalePrice and @maker_name = Products.MakerName and Products.Id <> (select Id from inserted)
	
--	if(@amount > -1)
--	begin
--		set @amount += @amount_ins
--		update Products
--		set Availability = @amount
--		where @name = Products.Name
--		delete from Products
--		where Products.Id = (select Id from inserted)
--	end
--	else
--		print('Данные добавлены успешно')
--end

--insert into Products(Name, Type, Availability, SelfPrice, SalePrice, MakerName)
--values
--('Fanta','Drink', 3, 14, 37, 'Ukrain');
--go
--select*
--from Products

--2===============================================
--create table ArchiveWorkers
--(
--	Id int identity(1, 1) not null primary key,
--	Position nvarchar(100) not null check(Position <> N''),
--	FirstName nvarchar(255) not null check(FirstName <> N''),
--	SecondName nvarchar(255) not null check(SecondName <> N''),
--	LastName nvarchar(255) not null check(LastName <> N''),
--	Admission Date not null,
--	Sex nvarchar(10) not null check(Sex <> N''),
--	Salery money,
--);
--go
--create trigger del_worker
--on Workers after delete
--as
--begin
--insert  ArchiveWorkers
--	select Position, FirstName, SecondName, LastName, Admission, Sex, Salery
--	from deleted
--end

--delete from Workers
--where Workers.Id = 2

--select*
--from ArchiveWorkers


--3==============================================
--create trigger add_seller
--on Workers after insert
--as
--begin
--	declare @counter int
--	select @counter = count(*)
--	from Workers
--	where Workers.Position like 'Seller'

--	if(@counter > 6)
--	begin
--		raiserror('Количество продавцов превышено', 0, 1)
--		rollback tran
--	end
--	else
--		print('Данные добавлены успешно')
--end

--insert into Workers(Position, FirstName, SecondName, LastName, Admission, Sex, Salery)
--values
--('Seller', 'Adeline', 'Adella', 'Adelle', '2012-02-08', 'F', 10000);
--go
--select*
--from Workers