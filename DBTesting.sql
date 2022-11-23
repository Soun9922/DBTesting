create database Eject;
use Eject;

create table EngineerTable1 (EngineerId int auto_increment, Name varchar(225), 
MobileNumber varchar(20),
Qualification varchar(50),
Experience int,
primary key (EngineerId));

insert into EngineerTable1(Name,MobileNumber,Qualification,Experience) values
('Amar Gupta', '9878654320', 'B.Tech', 2),
('Keshav Shengal', '9765432209', 'M.tech', 3),
('Yamini Jadav', '9988776512', 'Diploma', 1),
('Briti Patel', '8879008959', 'BCA', 4);

create table EngineerTable2 (EngineerId int auto_increment, Name varchar(225), 
MobileNumber varchar(20),
Qualification varchar(50),
Experience int,
foreign key (EngineerId) references EngineerTable1 (EngineerId));

insert into EngineerTable2(Name,MobileNumber,Qualification,Experience) values
('Bijoy Jha', '9987663210', 'MCA', 4),
('Arjun Kapadia', '8875091278', 'B.Tech', 2),
('Koyel Mondal', '9908229876', 'M.Tech', 3),
('Anudrita Kumar', '8896671190', 'BCA', 1);

select * from EngineerTable1;
select * from EngineerTable2;

drop table EngineerTable1;
drop table EngineerTable2;

truncate table EngineerTable1;
truncate table EngineerTable2;

-- Joins --
select * from EngineerTable2 left join EngineerTable1 on EngineerTable2.EngineerId = EngineerTable1.EngineerId;
select * from EngineerTable1 right join EngineerTable2 on EngineerTable1.EngineerId = EngineerTable2.EngineerId;
select * from EngineerTable1 inner join EngineerTable2 on EngineerTable2.EngineerId = EngineerTable1.EngineerId;

-- Clauses --
select Name,Qualification,count(*) from EngineerTable1 group by Qualification;
select * from EngineerTable2 order by EngineerId desc;
select * from EngineerTable1 where EngineerId > 2 order by Name asc;

-- Aggregate Functions --
select count(*) as Total_Engineers from EngineerTable1;
select min(EngineerId) as Minimum_Engineers from EngineerTable1;
select max(EngineerId) as Maximum_Engineers from EngineerTable1;

--  Stored Procedure  --
-- **Add Colums** --
call add_column_table1();

-- **Update Row** --
call update_row_table1();

-- **Delete Row** --
call delete_row_table1();

-- IN --
call get_Engineers(2);

-- OUT --
call row_count_table1(@Row_Count);
select @Row_Count as R_Counts;

-- INOUT -- 
call rowCount_usingINOUT(@Row_Count,2);
select @Row_Count as R_Count;

-- Subqueries --
select * from EngineerTable1 where EngineerId in (select EngineerId from EngineerTable2 where EngineerId = 3);
