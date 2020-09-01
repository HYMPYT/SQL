--1
--create procedure sp_hello
--as
--print 'Hello world'
--go

--exec sp_hello

--2
--create procedure sp_cur_time @t time output
--as
--set @t = convert(time, GETDATE())

--declare @t time
--exec sp_cur_time @t output
--print @t

--3
--create procedure sp_cur_date @d date output
--as
--set @d = convert(date, GETDATE())

--declare @d date
--exec sp_cur_date @d output
--print @d

--6
--create procedure sp_max_3 @a int, @b int, @c int
--as
--declare @max int
--if @a > @b
--set @max = @a
--else
--set @max = @b
--if @c > @max
--return @c
--else
--return @max

--declare @res int
--exec @res = sp_max_3 2, 4, 6
--print @res

--8
--create procedure sp_line @num int, @sym char
--as
--while @num > 0
--begin
--print @sym
--set @num -= 1
--end

--exec sp_line 3, #

--10
--create procedure sp_pow @num int, @step int
--as
--declare @res int = 1
--while @step > 0
--begin
--set @res *= @num
--set @step -= 1
--end
--return @res

--declare @res int
--exec @res = sp_pow 2, 8
--print @res




--if object_id('uf_hello') is not null
--drop function uf_hello
--go

--create function uf_hello()
--returns nvarchar(20)
--as
--begin
--return N'Hello wolrd'
--end

--declare @h nvarchar(20)
--exec @h = uf_hello
--print @h



--if object_id('uf_sum') is not null
--drop function uf_hello
--go

--create function uf_sum(@a int, @b int, @c int)
--returns int
--as
--begin
--return (@a + @b + @c)
--end

--declare @res int
--exec @res = uf_sum 1, 2, 3
--print @res