--use MusicalCollection
--go
--create procedure sp_hello
--as
--print 'Hello world'
--go
--exec sp_hello

--create procedure sp_sum;1 @a int, @b int
--as
--declare @res int
--set @res = @a + @b
--print @res
--exec sp_sum @a = 3, @b = 6

--create procedure sp_sum;2 @a int, @b int
--as
--declare @res int
--set @res = @a + @b
--return @res
--declare @res int
--exec @res = sp_sum;2 123, 345
--print @res

--create procedure sp_factorial @a int
--as
--declare @res int = 1
--while @a > 0
--begin
--set @res = @res * @a
--set @a -= 1
--end
--return @res
--declare @res int
--exec @res = sp_factorial 3
--print @res


--print 'Hello world'
--declare @a int = 3, @b int = 15, @res int
--set @res = @a + @b
--print @res

--if (@a > @b)
--print @a
--else
--print @b

--while @a <= @b
--begin
--print @a
--set @a += 1
--end

--raiserror (N'Today is %d %s %d', 10, 1, 16,'November', 2019)

--create procedure sp_get_all_MusicDisc
--as
--select*
--from MusicDisc
--exec sp_get_all_MusicDisc


--create procedure sp_get_all_sellers @price decimal
--as
--select*
--from Sales
--where Sales.Price > @price
--exec sp_get_all_sellers 100

--Тригеры
--create trigger add_confirm
--on Sales after insert
--as
--select*
--from inserted

--insert into Sales
--values('Yuppi', 12.34, '2019-11-17', 1, 4)

--create trigger print_deleted
--on Sales after delete
--as
--select*
--from deleted

delete from Sales
where Sales.ProductName = 'Yuppi'