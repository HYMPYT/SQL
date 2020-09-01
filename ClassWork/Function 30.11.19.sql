--1
--create function uf_hello(@a nvarchar(50))
--returns nvarchar(100)
--begin
--return N'Hello, ' + @a
--end

--declare @name nvarchar(50)
--exec @name = uf_hello 'Nick'
--print @name

--2
--create function uf_minute()
--returns int
--begin
--return datepart(minute, GETDATE())
--end

--declare @rez int
--exec @rez = uf_minute
--print @rez

--3
--create function uf_year()
--returns int
--begin
--return datepart(year, GETDATE())
--end

--declare @rez int
--exec @rez = uf_year
--print @rez

--4
--create function uf_check_year(@a int)
--returns nvarchar(20)
--begin
--if @a % 2 = 0
--begin
--return N'chotne'
--end
--return N'nechotne'
--end

--declare @rez nvarchar(20)
--exec @rez = uf_check_year 2018
--print @rez

--5
--create function uf_check_number(@num int)
--returns nvarchar(20)
--begin
--declare @i int = 2
--while @i <= @num / 2
--begin
--if @num % @i = 0
--return N'neprostoe'
--set @i += 1
--end
--return N'prostoe'
--end

--declare @rez nvarchar(20)
--exec @rez = uf_check_number 12
--print @rez
