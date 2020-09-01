--create database BookShop
--go
--use BookShop
--go
--create table Authors
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <> N''),
--	Surname nvarchar(max) not null check(Surname <> N''),
--	CountryId int not null
--);
--go
--create table Books
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <> N''),
--	Pages int not null check(Pages > 0),
--	Price money not null check(Price >= 0),
--	PublishDate date not null check(PublishDate <= getdate()),
--	AuthorId int not null,
--	ThemeId int not null
--);
--go
--create table Countries
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(50) not null unique check(Name <> N'')
--);
--go
--create table Sales
--(
--	Id int not null identity(1,1) primary key,
--	Price money not null check(Price >= 0),
--	Quantity int not null check(Quantity > 0),
--	SaleDate date not null default getdate() check(SaleDate <= getdate()),
--	BookId int not null,
--	ShopId int not null
--);
--go
--create table Shops
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <> N''),
--	CountryId int not null
--);
--go
--create table Themes
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(100) not null unique check(Name <> N'')
--);
--go

--alter table Authors
--add foreign key (CountryId) references Countries(Id);
--go

--alter table Books
--add foreign key (AuthorId) references Authors(Id);
--go

--alter table Books
--add foreign key (ThemeId) references Themes(Id);
--go

--alter table Sales
--add foreign key (BookId) references Books(Id);
--go

--alter table Sales
--add foreign key (ShopId) references Shops(Id);
--go

--alter table Shops
--add foreign key (CountryId) references Countries(Id);
--go

--insert into Themes(Name)
--values('Detective'),
--('Programming'),
--('Administration'),
--('Design'),
--('Microsoft'),
--('Fantasy');
--go
--insert into Countries(Name)
--values('Ukraine'),
--('Russia'),
--('Belarus'),
--('Romania'),
--('Greece');
--go
--insert into Authors(Name, Surname, CountryId)
--values('Herbert','Shildt', 5),
--('Scott','Rao', 4),
--('Tarik','Rashid', 3),
--('Michael','Lucas', 2),
--('Maria','Gableton', 1),
--('Yulia','Kagawa', 2);
--go
--insert into Books(Name, Pages, Price, PublishDate, AuthorId, ThemeId)
--values('Roaster steam', 650, 23.5, '2018-12-12', 2, 4),
--('Amsterdam', 500, 18, '2018-12-12', 5, 5),
--('Java', 500, 50, '2005-05-23', 1, 2),
--('Create a neural network', 400, 15, '2006-04-25', 3, 2),
--('FreeBSD Detailed guide', 350, 10, '2007-03-27', 4, 3),
--('Heart of Dragon', 700, 100, '2010-10-28', 5, 1),
--('Microsoft .NET', 300, 16, '2000-12-17', 4, 5),
--('Microsoft Windows', 400, 120, '2018-03-16', 6, 5),
--('Seven stones', 460, 20, '2006-08-14', 5, 6);
--go
--insert into Shops(Name, CountryId)
--values('Town',  1),
--('Your book', 2),
--('Handicap', 3),
--('Readers Club', 4);
--go
--insert into Sales(Price, Quantity, SaleDate, BookId, ShopId)
--values( 36, 30, '2000-12-12', 5, 1),
--( 100, 15, '2012-05-23', 2, 4),
--( 150, 10, '1990-04-27', 4, 2),
--( 140, 90, '2007-06-27', 6, 3),
--( 90, 14, '2012-12-12', 3, 2),
--( 34, 20, '2008-05-23', 8, 1);
--go


--1
--select Books.Name as 'Название книги'
--from Books
--where Books.Pages > 499 and Books.Pages < 651 

--2
--select Books.Name as 'Название книги'
--from Books
--where Books.Name like '[AZ]%'

--3
--Select Books.Name as 'Название книги'
--from Themes join Books on Themes.Id = Books.ThemeId join Sales on Books.Id = Sales.BookId
--where Themes.Name = 'Detective' and Sales.Quantity >= 30

--4
--select Books.Name as 'Название книги'
--from Books
--where Books.Name like 'Microsoft%' and Books.Name not like '%Windows'

--5
--select Books.Name as 'Название книги', Themes.Name as 'Тематика', Authors.Name + ' ' + Authors.Surname as 'Полное имя автора'
--from Themes join Books on Themes.Id = Books.ThemeId join Authors on Authors.Id = Books.AuthorId
--where Books.Price / Books.Pages < 0.65

--6
--select Books.Name as 'Название книги'
--from Books
--where Books.Name Like '% %'+'% %'+'% %'

--7
--select Books.Name as 'Название книги', Themes.Name as 'Тематика', Authors.Name + ' ' + Authors.Surname as 'Автор', Books.Price as 'Цена', Sales.Quantity as 'Количество продаж', Shops.Name as 'Название магазина'
--from Themes join Books on Themes.Id = Books.ThemeId join Authors on Authors.Id = Books.AuthorId join Sales on Books.Id = Sales.BookId join Shops on Shops.Id = Sales.ShopId join Countries on Countries.Id = Shops.CountryId
--where Books.Name not like 'A%' and Themes.Name != 'Programming' and Authors.Name != 'Herbert' and Authors.Surname != 'Shildt' and (Books.Price between 10 and 20) and Sales.Quantity >= 8 and (Countries.Name != 'Ukraine' or Countries.Name != 'Russia')

--8
--select count(distinct Authors.Name) as 'Количество авторов:', count(Books.Name) as 'Количество книг:', avg(Books.Price) as 'Средняя цена продажи:', avg(Books.Pages) as 'Среднее количество страниц:'
--from Books join Authors on Authors.Id = Books.AuthorId


--9
--select Themes.Name as 'Тематика', sum(Books.Pages) as 'Сумма страниц'
--from Themes join Books on Themes.Id = Books.ThemeId
--group by Themes.Name

--10
--select Authors.Name + ' ' + Authors.Surname as 'Полное имя автора', count(Books.Name) as 'Количество книг', sum(Books.Pages) as 'Сумма страниц'
--from Authors join Books on Authors.Id = Books.AuthorId
--group by Authors.Name, Authors.Surname

--11
--select Books.Name as 'Название книги', Books.Pages as 'Kоличество страниц'
--from Books join Themes on Books.ThemeId = Themes.Id and Themes.Name in ('Programming') 
--where Books.Pages in (
--  select max(Pages)
--  from Books join Themes on Books.ThemeId = Themes.Id and Themes.Name in ('Programming') 
--)

--12
--select Themes.Name as 'Тематика', avg(Books.Pages) as 'Cреднее количество страниц'
--from Themes join Books on Themes.Id = Books.ThemeId
--group by Themes.Name
--having avg(Books.Pages) <= 400

--13
--select Themes.Name as 'Тематика', sum(Books.Pages) as 'Сумма страниц'
--from Themes join Books on Themes.Id = Books.ThemeId
--where Books.Pages > 400 and (Themes.Name = 'Programming' or Themes.Name = 'Administration' or Themes.Name = 'Design')
--group by Themes.Name

--14
--select Books.Name as 'Название книги', Countries.Name as 'Страна', Shops.Name as 'Магазин', Sales.SaleDate as 'Дата продажи', Sales.Quantity as 'Количество проданых единиц товара'
--from Countries join Shops on Countries.Id = Shops.CountryId join Sales on Shops.Id = Sales.ShopId join Books on Books.Id = Sales.BookId

--15
--select Shops.Name as 'Cамый прибыльный магазин', Sales.Price*Sales.Quantity as 'Прибыль'
--from Shops join Sales on Shops.Id = Sales.ShopId
--where Sales.Price*Sales.Quantity in (
--select max(Sales.Price*Sales.Quantity)
--from Shops join Sales on Shops.Id = Sales.ShopId
--)