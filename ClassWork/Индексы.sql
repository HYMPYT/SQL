use IndexesDB
go
/*
set statistics io on
set statistics time on
*/
select user_id, username, first_name
from user_details
where username = 'mike28'

--create index ix_user_details_username on user_details
--(username) include (first_name)

--drop index ix_user_details_username on user_details