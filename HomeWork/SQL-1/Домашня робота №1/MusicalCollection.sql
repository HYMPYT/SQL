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
--add foreign key(PublisherId) references Publishers(Id);
--go

--alter table MusicDisc
--add foreign key(StileId) references Stiles(Id);
--go

--alter table MusicDisc
--add foreign key(SingerId) references Singers(Id);
--go

--alter table Songs
--add foreign key(MusicDiscId) references MusicDisc(Id);
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
--('Till i collapse', 4.34, 2, 1, 3),
--('Yamakasi', 3.45, 4, 3, 1),
--('Hilf mir', 4.44, 3, 2, 2),
--('Bitch Please II', 4.48, 2, 1, 3);
--go

--Task 1
--1
--create view SingersName as
--select Singers.Name as Name
--from Singers

--select*
--from SingersName

--2
--create view SongsInfo (SongName, Duration, MusicDiscName, Stile, Singer)as
--select Songs.Name, Songs.Duration, MusicDisc.Name, Stiles.Name, Singers.Name
--from Singers join Songs on Singers.Id = Songs.SingerId join Stiles on Stiles.Id = Songs.StileId join MusicDisc on MusicDisc.Id = Songs.MusicDiscId

--select*
--from SongsInfo

--3
--create view Eminem (Name, Publisher, Stile) as
--select MusicDisc.Name, Publishers.Name, Stiles.Name
--from Publishers join MusicDisc on Publishers.Id = MusicDisc.PublisherId join Stiles on Stiles.Id = MusicDisc.StileId join Singers on Singers.Id = MusicDisc.SingerId
--where Singers.Name = 'Eminem'

--select*
--from Eminem

--4
--create view PopularSinger as
--select top(1)Singers.Name as 'Name', count(MusicDisc.SingerId) as 'Count'
--from MusicDisc join Singers on MusicDisc.SingerId = Singers.Id
--group by Singers.Name
--order by Count desc

--select*
--from PopularSinger

--5
--create view PopularSingers as
--select top(3)Singers.Name as 'Name', count(MusicDisc.SingerId) as 'Count'
--from MusicDisc join Singers on MusicDisc.SingerId = Singers.Id
--group by Singers.Name
--order by Count desc

--select*
--from PopularSingers

--6
--create view TheLongestMusicAlbum as
--select top(1)MusicDisc.Name as 'Name', sum(Songs.Duration) as 'AllTheDuration'
--from MusicDisc join Songs on Songs.MusicDiscId = MusicDisc.Id
--group by MusicDisc.Name
--order by AllTheDuration desc

--select*
--from TheLongestMusicAlbum

--Task 2
--1
--create view StilesView as
--select Stiles.Name as 'Stile'
--from Stiles
--with check option

--insert into StilesView
--values('Regi')

--select*
--from StilesView

--2
--create view SongsView as
--select Songs.Name as 'Name', Songs.Duration as 'Duration', Songs.MusicDiscId as 'MusicDiscId', Songs.SingerId as 'SingerId', Songs.StileId as 'StileId'
--from Songs
--with check option

--insert into SongsView
--values('Mann gegen Mann', 3.47, 3,2,2)
--go

--select*
--from SongsView

--3
--create view PublishersView as 
--select Publishers.Name as 'Name', Publishers.Country as 'Country'
--from Publishers
--with check option

--insert into PublishersView
--values('Megofon', 'England')
--go

--update PublishersView
--set Name = 'Gold Music' where Country = 'England'

--select*
--from PublishersView

--4
--create view SingersView as 
--select Singers.Name as 'Name'
--from Singers
--with check option

--insert into SingersView
--values('BASTA')
--go

--delete from SingersView
--where Name = 'BASTA'
--go

--select*
--from SingersView

--5
--create view SingerView as
--select Singers.Name as 'Name'
--from Singers
--where Singers.Name = 'Eminem'
--with check option

--update SingerView
--set Name = 'EMINEM' where Name = 'Eminem'
--go

--select*
--from SingerView
