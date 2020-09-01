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

--1
--create procedure sp_info
--as
--select MusicDisc.Name as 'Name', MusicDisc.DateOfPublicashion as 'Date of publication'
--from MusicDisc
--go

--exec sp_info

--2
--create procedure sp_spec_info @publisher nvarchar(50)
--as
--select MusicDisc.Name as 'Name', MusicDisc.DateOfPublicashion as 'Date of publication'
--from Publishers join MusicDisc on Publishers.Id = MusicDisc.PublisherId
--where Publishers.Name = @publisher
--go

--exec sp_spec_info 'Music'

--3
--create procedure sp_top_stile
--as
--select top(1) Stiles.Name as 'Name', count(MusicDisc.StileId) as 'Number'
--from Stiles join MusicDisc on Stiles.Id = MusicDisc.StileId
--group by Stiles.Name
--order by Number desc
--go

--exec sp_top_stile

--4
--create procedure sp_info_spec_stile @stile nvarchar(50)
--as
--if @stile = 'all'
--begin
--select top(1) MusicDisc.Name as 'Name', MusicDisc.DateOfPublicashion as 'Date of publication', count(Songs.MusicDiscId) as 'Number'
--from Songs join MusicDisc on Songs.MusicDiscId = MusicDisc.Id
--group by MusicDisc.Name, MusicDisc.DateOfPublicashion
--order by Number desc
--end
--else
--begin
--select top(1) MusicDisc.Name as 'Name', MusicDisc.DateOfPublicashion as 'Date of publication', count(Songs.MusicDiscId) as 'Number'
--from Songs join MusicDisc on Songs.MusicDiscId = MusicDisc.Id join Stiles on MusicDisc.StileId = Stiles.Id
--where Stiles.Name = @stile
--group by MusicDisc.Name, MusicDisc.DateOfPublicashion
--order by Number desc
--end
--go

--exec sp_info_spec_stile 'Rep'

--5
--create procedure sp_del_music_disc @stile nvarchar(50)
--as
--declare @num int
--set nocount on
--select @num = count(*)
--from MusicDisc join Stiles on MusicDisc.StileId = Stiles.Id
--where Stiles.Name = @stile
--delete
--from MusicDisc
--where MusicDisc.StileId in
--(select Stiles.Id
--from Stiles
--where Stiles.Name = @stile)
--return @num
--go

--declare @rez int
--exec @rez = sp_del_music_disc 'Rep'
--print @rez

--6
--create procedure sp_info_old_and_young_disc
--as
--select top(1)MusicDisc.Name as 'Name of old disc', MusicDisc.DateOfPublicashion as 'Date of publication'
--from MusicDisc
--order by MusicDisc.DateOfPublicashion

--select top(1)MusicDisc.Name as 'Name of young disc', MusicDisc.DateOfPublicashion as 'Date of publication'
--from MusicDisc
--order by MusicDisc.DateOfPublicashion desc
--go

--exec sp_info_old_and_young_disc

--7
--create procedure sp_del_music_disc_word @Word nvarchar(20)
--as
--declare @num int
--select @num = count(*)
--from MusicDisc
--where MusicDisc.Name like '%' + @Word + '%'

--delete
--from MusicDisc
--where MusicDisc.Name like '%' + @Word + '%'
--return @num
--go

--declare @rez int
--exec @rez = sp_del_music_disc_word 'Reco'
--print @rez