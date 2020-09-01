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
--add foreign key(SalerNameId) references Workers(Id);
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


--1
--create procedure sp_info
--as
--select Products.Name as 'Name', Products.Type as 'Type', Products.Availability as 'Availability', Products.SelfPrice as 'Self price', Products.SalePrice as 'Sale price', Products.MakerName as 'Maker name'
--from Products
--go

--exec sp_info

--2
--create procedure sp_spec_info @type nvarchar(30)
--as
--select Products.Name as 'Name', Products.Type as 'Type', Products.Availability as 'Availability', Products.SelfPrice as 'Self price', Products.SalePrice as 'Sale price', Products.MakerName as 'Maker name'
--from Products
--where Products.Type = @type
--go

--exec sp_spec_info 'Food'

--3
--create procedure sp_top3_old_buyers
--as
--select top(3) Buyers.FirstName + ' ' + Buyers.SecondName + ' ' + Buyers.LastName as 'Full name', Buyers.Registration as 'Registration'
--from Buyers
--order by Buyers.Registration
--go

--exec sp_top3_old_buyers


--4
--create procedure sp_top1_workers
--as
--select top(1) Workers.FirstName + ' ' + Workers.SecondName + ' ' + Workers.LastName as 'Name', Workers.Salery as 'Salery', Workers.Sex as 'Sex', Workers.Position as 'Position', Sales.Sold as 'Sold'
--from Workers join Sales on Workers.Id = Sales.SalerNameId
--order by Sales.Sold desc
--go

--exec sp_top1_workers

--5
--create procedure sp_check_products @manufacturer nvarchar(50)
--as
--set nocount on
--declare @num int
--select @num = COUNT(*)
--from Products
--where Products.MakerName = @manufacturer
--if @num >= 1
--print 'Yes'
--else
--print 'No'
--go

--exec sp_check_products 'Germany'

--6
--create procedure sp_top1_manufacturer
--as
--select top(1) Products.MakerName as 'Manufacturer', Sales.Sold as 'Sold', Products.Name as 'Product'
--from Products join Sales on Products.Id = Sales.ProductId
--order by Sales.Sold desc
--go

--exec sp_top1_manufacturer

--7
--create procedure sp_del_buyers @d date
--as
--declare @num int
--set nocount on
--select @num = count(*)
--from Buyers
--where Buyers.Registration > @d

--delete 
--from Buyers
--where Buyers.Registration > @d

--return @num * 2
--go

--declare @num int
--exec @num = sp_del_buyers '2013-12-23'
--print @num


