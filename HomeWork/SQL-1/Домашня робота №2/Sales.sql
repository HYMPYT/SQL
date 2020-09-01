--create database Sales
--go
--use Sales
--go
--create table Sellers
--(
--	Id int not null identity(1,1) primary key,
--	FirstName nvarchar(max) not null check(FirstName <>N''),
--	SecondName nvarchar(max) not null check(SecondName <>N''),
--	LastName nvarchar(max) not null check(LastName <>N''),
--	Email nvarchar(max) not null check(Email <>N''),
--	Number nvarchar(max) not null check(Number <>N'')
--);
--go
--create table Buyers
--(
--	Id int not null identity(1,1) primary key,
--	FirstName nvarchar(max) not null check(FirstName <>N''),
--	SecondName nvarchar(max) not null check(SecondName <>N''),
--	LastName nvarchar(max) not null check(LastName <>N''),
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
--add foreign key(SellersId) references Sellers(Id) on delete cascade;
--go
--alter table Sales
--add foreign key(BuyersId) references Buyers(Id) on delete cascade;
--go

--insert Sellers(FirstName, SecondName, LastName, Email, Number)
--values('Trubizun', 'Ivan', 'Petrovuch','Trubizun@gmail.com','+380951234345'),
--('Haustovuch', 'Andriy', 'Olegovuch','HausAO@gmail.com','+380960122312'),
--('Trofimcov', 'Dmutro', 'Viktorovuch','DmutroVik@mail.ru','+380678321345'),
--('Melnuk', 'Uriy', 'Ivanovuch','IvanovuchU@ukr.net','+380984517658');
--go
--insert Buyers(FirstName, SecondName, LastName, Email, Number)
--values('Domin', 'Illya', 'Andriyovuch','Dominant228@gmail.com','+380670125746'),
--('Kvozin', 'Oleg', 'Leonidovuch','Kvoz775@gmail.com','+380673492018'),
--('Zorin', 'Viktor', 'Petrovuch','vzorin@ukr.net','+380440271183'),
--('Pachenko', 'Anton', 'Sergiyovuch','pacha@mail.ru','+380967043748');
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

--1========================================
--create table OneFirstName
--(
--	Id int not null identity(1,1) primary key,
--	FirstName nvarchar(max) not null check(FirstName <>N''),
--	SecondName nvarchar(max) not null check(SecondName <>N''),
--	LastName nvarchar(max) not null check(LastName <>N''),
--	Email nvarchar(max) not null check(Email <>N''),
--	Number nvarchar(max) not null check(Number <>N'')
--);
--go

--create trigger add_buyers
--on Buyers after insert
--as
--begin
--	declare @first_name nvarchar(50), @num int = 0
--	select @first_name = FirstName
--	from inserted

--	select @num = count(*)
--	from Buyers
--	where @first_name = Buyers.FirstName and Buyers.Id <> (select Id from inserted)

--	if(@num > 0)
--	begin
--		insert OneFirstName
--			select FirstName, SecondName, LastName, Email, Number
--			from inserted
--		print('ƒанные добавлены успешно')
--	end
--	else
--		print('ƒанные добавлены успешно')
--end

--insert into Buyers(FirstName, SecondName, LastName, Email, Number)
--values
--('Zorin', 'Andriy', 'Petrovuch','azaza@ukr.net','+380473921183')
--go

--select*
--from OneFirstName

--2=====================================
--create table PurchaseHistory
--(
--	Id int not null identity(1,1) primary key,
--	ProductName nvarchar(100) not null check(ProductName <>N''),
--	Price money not null check(Price >= 0),
--	DateOfSale date not null,
--	SellersId int not null,
--	BuyersId int not null
--);
--go

--create trigger del_buyer
--on Buyers instead of delete
--as
--begin
--	declare @Id int = (select Id from deleted)
--	insert PurchaseHistory
--		select Sales.ProductName, Sales.Price, Sales.DateOfSale, Sales.SellersId, Sales.BuyersId
--		from Sales
--		where Sales.BuyersId = @Id

--		delete from Buyers
--		where Buyers.Id = @Id
--end

--delete from Buyers
--where Buyers.Id = 4

--select*
--from PurchaseHistory

--select*
--from Buyers

--3===================================
--create trigger add_seller
--on Sellers after insert
--as
--begin
--	declare @num int = 0, @first_name nvarchar(50), @second_name nvarchar(50), @last_name nvarchar(50)
--	select @first_name = FirstName, @second_name = SecondName, @last_name = LastName
--	from inserted

--	select @num = count(*)
--	from Buyers
--	where @first_name = Buyers.FirstName and @second_name = Buyers.SecondName and @last_name = Buyers.LastName

--	if(@num > 0)
--	begin
--		raiserror('ƒобавление невозможно посколько данный человек уже записан в таблице покупателей', 0, 1)
--		rollback tran
--	end
--	else
--		print('ƒанные добавлены успешно')
--end

--insert Sellers(FirstName, SecondName, LastName, Email, Number)
--values
--('Zorin', 'Viktor', 'Petrovuch','vzorin@ukr.net','+380440271183');
--go

--4===================================================
--create trigger add_buyers
--on Buyers after insert
--as
--begin
--	declare @num int = 0, @first_name nvarchar(50), @second_name nvarchar(50), @last_name nvarchar(50)
--	select @first_name = FirstName, @second_name = SecondName, @last_name = LastName
--	from inserted

--	select @num = count(*)
--	from Sellers
--	where @first_name = Sellers.FirstName and @second_name = Sellers.SecondName and @last_name = Sellers.LastName

--	if(@num > 0)
--	begin
--		raiserror('ƒобавление невозможно посколько данный человек уже записан в таблице продавцов', 0, 1)
--		rollback tran
--	end
--	else
--		print('ƒанные добавлены успешно')
--end

--insert Buyers(FirstName, SecondName, LastName, Email, Number)
--values
--('Trubizun', 'Ivan', 'Petrovuch','Trubizun@gmail.com','+380951234345');
--go

--5==========================================
--create trigger add_sale
--on Sales after insert
--as
--begin
--	declare @product_name nvarchar(50) = (select ProductName from inserted)
--	if(@product_name = 'Apples' or @product_name = 'Pears' or @product_name = 'Plums' or @product_name = 'Cilantro')
--	begin
--		raiserror('ƒобавление товаров, а именно: €блоки, груши, сливы, кинза запрещено', 0, 1)
--		rollback tran
--	end
--	else
--		print('ƒанные добавлены успешно')
--end

--insert Sales(ProductName, Price, DateOfSale, SellersId, BuyersId)
--values
--('Apples', 25.90, '2019-11-13', 1, 2);
--go