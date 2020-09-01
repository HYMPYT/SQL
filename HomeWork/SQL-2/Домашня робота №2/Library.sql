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
values('��������� �����. ������ �����', '���� �������', '������� ����������', '���', 2019, 100),
('���������. ������� �������', '���� ������', '������� ����������','�����-�����', 2012, 150),
('�����������. ����� �������', '���� �������' ,'������� ����������','���', 2018, 100),
('�������� ������', '����� ��������', '���������','�����', 2005, 125),
('������ ������', '���� �������', '������ ����������','���', 2013, 90),
('�����', '������ ������ ����������', '�������','�����', 1998, 40),
('���������� ���', '������ ��������', '���������','�����', 1996, 60),
('�������������', '����� �������', '���������','������', 1999, 87),
('����� �����', '�. ����-�����', '����� � �������','���', 2006, 98),
('������� ��������', '���� �������', '������� ����������','������', 1997, 128)*/

--select id, title as '��������', author as '�����', genre as '����', publishing as '������������', p_year as '��� �������', price as '����'
--from Book_info

--select title as '��������', p_year as '��� �������'
--from Book_info
--where p_year > 2000

--select title as '��������', author as '�����', genre as '����', publishing as '������������'
--from Book_info
--where publishing = '���'

SELECT author as '�����', COUNT(*) as '�������� ����'
FROM Book_info
GROUP BY author
HAVING COUNT(*) > 3
