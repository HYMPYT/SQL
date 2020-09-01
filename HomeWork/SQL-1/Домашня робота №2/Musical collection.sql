--create database MusicalCollection
--go
--use MusicalCollection
--go
--create table MusicDisc
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <> N''),
--	DateOfPublicashion date not null,
--	PublisherId int not null,
--	StileId int not null,
--	SingerId int not null
--);
--go
--create table Stiles
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(100) not null check(Name <>N'')
--);
--go
--create table Singers
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <>N'')
--);
--go
--create table Publishers
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <>N''),
--	Country nvarchar(max) not null check(Country <> N'')
--);
--go
--create table Songs
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(100) not null check(Name <>N''),
--	Duration float not null check(Duration > 0),
--	MusicDiscId int not null,
--	SingerId int not null,
--	StileId int not null
--);
--go
--alter table MusicDisc
--add foreign key(PublisherId) references Publishers(Id) ;
--go

--alter table MusicDisc
--add foreign key(StileId) references Stiles(Id);
--go

--alter table MusicDisc
--add foreign key(SingerId) references Singers(Id);
--go

--alter table Songs
--add foreign key(MusicDiscId) references MusicDisc(Id) on delete cascade;
--go

--alter table Songs
--add foreign key(SingerId) references Singers(Id);
--go

--alter table Songs
--add foreign key(StileId) references Stiles(Id);
--go

--insert Publishers(Name, Country)
--values('ASM','USA'),
--('Music','Germany'),
--('Muzmapa','Russia'),
--('7Days','USA');
--go
--insert Singers(Name)
--values('Eminem'),
--('Rammstein'),
--('Guf');
--go
--insert Stiles(Name)
--values('Rep'),
--('Rock'),
--('Hip-Hop');
--go
--insert MusicDisc(Name, DateOfPublicashion, PublisherId, SingerId, StileId)
--values('Infinite', '1996-11-12', 1, 1, 1),
--('Recovery', '2010-06-18', 4, 1, 3),
--('Rosenrot', '2005-10-28', 2, 2, 2),
--('CENTR', '2008-08-12', 3, 3, 1);
--go
--insert Songs(Name, Duration, MusicDiscId, SingerId, StileId)
--values('Lose Yourself', 3.58, 1, 1, 1),
--('Without me', 5.43, 1, 1, 1),
--('Rosenrot', 3.56, 3, 2, 2),
--('Mann gegen Mann', 3.50, 3, 2, 2),
--('Till i collapse', 4.34, 2, 1, 3),
--('Yamakasi', 3.45, 4, 3, 1),
--('Hilf mir', 4.44, 3, 2, 2),
--('Bitch Please II', 4.48, 2, 1, 3);
--go

--1============================================
--create trigger add_music_disc
--on MusicDisc after insert
--as
--begin
--	declare @name nvarchar(50), @date date, @stile_id int, @num int = 0
--	select @name = Name, @date = DateOfPublicashion, @stile_id = StileId
--	from inserted

--	select @num = count(*)
--	from MusicDisc
--	where @name = MusicDisc.Name and @date = MusicDisc.DateOfPublicashion and @stile_id = MusicDisc.StileId and MusicDisc.Id <> (select Id from inserted)

--	if(@num > 0)
--	begin
--		raiserror('Данный альбом уже существует', 0, 1)
--		rollback tran
--	end
--	else
--		PRINT('Данные добавлены успешно')
--end

--insert into MusicDisc(Name, DateOfPublicashion, PublisherId, SingerId, StileId)
--values
--('Infinite', '1996-11-12', 1, 1, 1);
--go

--2===========================================
--create trigger del_disc
--on MusicDisc after delete
--as
--begin
--	declare @num int = 0, @singer_id int
--	select @singer_id = SingerId
--	from deleted

--	select @num = count(*)
--	from  Singers
--	where Singers.Id = @singer_id and Singers.Name = 'Eminem'

--	if(@num > 0)
--	begin
--		raiserror('Невозможно удалить диск исполнителя Eminem', 0, 1)
--		rollback tran
--	end
--	else
--		print('Данные удалены успешно')
--end

--delete from MusicDisc
--where MusicDisc.Id = 1

--3=============================================
--create table Archive
--(
--	Id int not null identity(1,1) primary key,
--	Name nvarchar(max) not null check(Name <> N''),
--	DateOfPublicashion date not null,
--	PublisherId int not null,
--	StileId int not null,
--	SingerId int not null
--);
--go

--create trigger insert_archive_after_del
--on MusicDisc after delete
--as
--begin
--	insert Archive
--		select Name, DateOfPublicashion, PublisherId, SingerId, StileId
--		from deleted
--end

--delete from MusicDisc
--where MusicDisc.Id = 4
--go
--select*
--from Archive

--4=======================================
--create trigger add_some_kind_of_disc
--on MusicDisc after insert
--as
--begin
--	declare @num int = 0, @stile_id int
--	select @stile_id = StileId
--	from inserted

--	select @num = count(*)
--	from Stiles
--	where @stile_id = Stiles.Id and Stiles.Name = 'Hip-Hop'

--	if(@num > 0)
--	begin
--		raiserror('Диски данного стиля добавлять запрещено', 0, 1)
--		rollback tran
--	end
--	else
--		print('Данные добавлены успешно')
--end

--insert MusicDisc(Name, DateOfPublicashion, PublisherId, SingerId, StileId)
--values
--('AFD', '2008-08-12', 3, 3, 3);
--go

--select*
--from MusicDisc