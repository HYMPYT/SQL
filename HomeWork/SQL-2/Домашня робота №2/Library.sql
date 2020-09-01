/*create database Library
go
use Library
create table Book_info
(
	id int identity primary key not null,
	title nvarchar(50) not null,
	author nvarchar(30) not null,
	genre nvarchar(30) not null,
	publishing nvarchar(100) not null, 
	p_year int not null,
	price money not null check(price >= 0) default 0
);*/

/*insert Book_info(title, author, genre, publishing, p_year, price)
values('Проклятое место. Дорога домой', 'Артём Помозов', 'Научная фантастика', 'АСТ', 2019, 100),
('Мироходцы. Пустота снаружи', 'Илья Крымов', 'Научная фантастика','АЛЬФА-КНИГА', 2012, 150),
('Подмосковье. Эпоха раскола', 'Артём Помозов' ,'Научная фантастика','АСТ', 2018, 100),
('Плюшевая засада', 'Дарья Калинина', 'Детективы','Эксмо', 2005, 125),
('Волчья правда', 'Артём Помозов', 'Боевая фантастика','АСТ', 2013, 90),
('ЧУЖОЙ', 'Герман Сергей Эдуардович', 'Боевики','Эксмо', 1998, 40),
('Неискренне ваш', 'Галина Куликова', 'Детективы','Эксмо', 1996, 60),
('Правозащитник', 'Артур Строгов', 'Детективы','Эдитус', 1999, 87),
('Песнь теней', 'С. Джей-Джонс', 'Ужасы и мистика','АСТ', 2006, 98),
('Мертвый источник', 'Артём Помозов', 'Научная фантастика','ЛитРес', 1997, 128)*/

--select id, title as 'Название', author as 'Автор', genre as 'Жанр', publishing as 'Издательство', p_year as 'Год издания', price as 'Цена'
--from Book_info

--select title as 'Название', p_year as 'Год издания'
--from Book_info
--where p_year > 2000

--select title as 'Название', author as 'Автор', genre as 'Жанр', publishing as 'Издательство'
--from Book_info
--where publishing = 'АСТ'

SELECT author as 'Автор', COUNT(*) as 'Написано книг'
FROM Book_info
GROUP BY author
HAVING COUNT(*) > 3
