--create database Sales
--go
--use Sales
--go
--create table Sellers
--(
--	Id int not null identity(1,1) primary key,
--	FullName nvarchar(max) not null check(FullName <>N''),
--	Email nvarchar(max) not null check(Email <>N''),
--	Number nvarchar(max) not null check(Number <>N'')
--);
--go
--create table Buyers
--(
--	Id int not null identity(1,1) primary key,
--	FullName nvarchar(max) not null check(FullNAme <>N''),
--	Email nvarchar(max) not null check(Email <>N''),
--	Number nvarchar(max) not null check(Number <>N'')
--);
--go
--create table Sales
--(
--	Id int not null identity(1,1) primary key,
--	ProductName nvarchar(100) not null check(ProductName <>N''),
--	Price money not null check(Price >= 0),
--	DateOfSale date not null,
--	SellersId int not null,
--	BuyersId int not null
--);
--go
--alter table Sales
--add foreign key(SellersId) references Sellers(Id);
--go
--alter table Sales
--add foreign key(BuyersId) references Buyers(Id);
--go

--insert Sellers(FullName, Email, Number)
--values('Trubizun Ivan Petrovuch','Trubizun@gmail.com','+380951234345'),
--('Haustovuch Andriy Olegovuch','HausAO@gmail.com','+380960122312'),
--('Trofimcov Dmutro Viktorovuch','DmutroVik@mail.ru','+380678321345'),
--('Melnuk Uriy Ivanovuch','IvanovuchU@ukr.net','+380984517658');
--go
--insert Buyers(FullName, Email, Number)
--values('Domin Illya Andriyovuch','Dominant228@gmail.com','+380670125746'),
--('Kvozin Oleg Leonidovuch','Kvoz775@gmail.com','=380673492018'),
--('Zorin Viktor Petrovuch','vzorin@ukr.net','+380440271183'),
--('Pachenko Anton Sergiyovuch','pacha@mail.ru','+380967043748');
--go
--insert Sales(ProductName, Price, DateOfSale, SellersId, BuyersId)
--values('Apples', 25.90, '2019-11-13', 1, 2),
--('Sweets', 115.50, '2019-10-16', 2, 1),
--('Bananas', 28.45, '2019-10-29', 3, 3),
--('Potatoes', 30.00, '2019-11-19', 4, 4),
--('Mivina', 3.00, '2019-08-22', 1, 2),
--('Fish', 97.45, '2019-09-25', 2, 2),
--('Water', 28.90, '2019-10-24', 3, 4),
--('Apples', 43.35, '2019-10-11', 2, 4),
--('Cereals', 36.55, '2019-11-08', 4, 3),
--('Sausages', 145.80, '2019-11-15', 2, 1);
--go

--Task 3
--1
--create view SellersView (FullName, Email, Number)as
--select Sellers.FullName, Sellers.Email, Sellers.Number
--from Sellers

--select*
--from SellersView

--2
--create view BuyersView (FullName, Email, Number) as
--select Buyers.FullName, Buyers.Email, Buyers.Number
--from Buyers

--select*
--from BuyersView

--3
--create view SalesView (ProductName, Price, DateOfSale) as
--select Sales.ProductName, Sales.Price, Sales.DateOfSale
--from Sales
--where Sales.ProductName = 'Apples'

--select*
--from SalesView

--4
--create view AllSalesView (ProductName, Price, DateOfSale) as
--select Sales.ProductName, Sales.Price, Sales.DateOfSale
--from Sales

--select*
--from AllSalesView

--5
--create view SellerView (FullName, Email, Number, SaleSum)as
--select top(1)Sellers.FullName, Sellers.Email, Sellers.Number, sum(Sales.Price) as 'SaleSum'
--from Sellers join Sales on Sales.SellersId = Sellers.Id
--group by Sellers.FullName, Sellers.Email, Sellers.Number
--order by SaleSum desc

--select*
--from SellerView

--6
--create view BuyerView (FullName, Email, Number, SaleSum)as
--select top(1)Buyers.FullName, Buyers.Email, Buyers.Number, sum(Sales.Price) as 'SaleSum'
--from Buyers join Sales on Sales.BuyersId = Buyers.Id
--group by Buyers.FullName, Buyers.Email, Buyers.Number
--order by SaleSum desc

--select*
--from BuyerView
