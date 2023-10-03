create database Supermarket1702583;
use Supermarket1702583;


create table Professor 
(
TRN int primary key,
f_name varchar (20) not null,
l_name varchar (20) not null,
);
create table Course 
(
course_Id varchar (6) primary key,
c_name varchar (20) not null,
);
create table Teach
(
TRN int not null,
course_Id varchar (6) not null,
recorded int not null,
#ofsemester int not null,
Constraint pk_teach primary key(TRN,course_Id),
Constraint fk_TRN foreign key (TRN) references professor(TRN),
Constraint fk_course_Id foreign key (course_Id) references Course(course_Id),
);


create table Region
(
region# int primary key,
r_name varchar (20) not null,
);
create table Factory 
(
factoryID varchar (6) primary key,
region# int references Region
);
create table Emp 
(
emp_ID varchar (6) primary key,
name varchar (35) not null,
factoryID varchar (6) references Factory 
);
alter table Emp
add age int;
alter table Emp
add position varchar (15);
alter table Emp
add salary numeric(6,2);
alter table Emp
drop column name;


create table Dummy
(
dummy_id varchar(4) primary key,
dummy_name varchar(30) not null,
dummy_address varchar (50) not null
);
drop table Dummy

create table member
(
mem_Id int primary key,
mailling varchar(100) not null,
dob date not null,
fname varchar (20) not null,
mname varchar(20) not null,
lname varchar(20) not null
);

create table M_phone
(
phone_number varchar(15) not null,
mem_Id int references member,
Constraint pk_M_phone primary key(mem_Id)
);

create table product
(
code varchar (15) primary key,
discription varchar(20) not null,
price int not null,
category varchar (15)  null,
inventory varchar (10) not null
);
create table Employee
(
fname varchar (20) not null,
lname varchar(20) not null,
dob date not null,
emp_id varchar(15) primary key,
date_started date not null
);
create table Invoice
(
invoice# varchar(10) primary key,
cashier varchar (25) not null,
date date null,
member_id int references member,
emp_id varchar(15) references Employee,
total int not null
);

create table Contain
(
invoice# varchar(10) not null,
code varchar(15) not null,
quantity int null,
Constraint pk_contains primary key(invoice#,code),
Constraint fk_invoice# foreign key (invoice#) references Invoice(invoice#),
Constraint fk_code foreign key (code) references product(code)
);
alter table Member
add parish varchar(25)
alter table Employee
add gender varchar(10) not null
alter table Employee
add parish varchar (25)

 /* Lab Manual 2*/
insert into member values(1001,'Pamphret','05/05/1998','Ricardo','Shane','Johnson','St.Thomas')

insert into member values
(2000,'Albion','10/12/1998','Chris','Jones','Clark','Kingston'),
(1002,'James','12/12/1978','Junie','Chris','John','St.James'),
(3221,'White Lane','09/09/1945','Gloria','Van','Cole','Hanova'),
(2110,'Albion','12/03/1996','Chrisann','Jones','Johnson','Portland')
select* from member

insert into M_phone values
('8762811321',1001),
('8765079823',2000),
('8763577734',1002),
('8768837386',3221),
('8763375290',2110)

select* from M_phone

insert into product values
('21343','Good',300,'small','inventory3'),
('12234','Very Good',5000,'large','inventory1'),
('226431','Fair',30,'medium','inventory2'),
('53423','Excellent',1300,'small','inventory3'),
('667966','Excellent',5000,'medium','inventory2')

select* from product

insert into Employee values('James', 'Jones','03/14/1996','2010','12/12/2016','Male','Kingston')

insert into Employee values
('Joanna', 'Facey','08/29/1999','2013','12/11/2019','Female','St.Thomas'),
('Ricky' ,'Jones','09/12/1997','2017','05/06/2017','Male','St.James'),
('Junie', 'Facey','03/15/1996','2018','06/03/2016','Female','Portland'),
('Chrisann', 'Fray','06/11/2000','2019','04/12/2019','Female','St.Mary')

select* from Employee
select * from product
insert into Invoice values
('2234ER','James','11/10/2017',1001,'2010',5000),
('2434HG','Ricky','03/12/2019',1002,'2017',300),
('4432SD','Joanna','05/20/2016',2000,'2013',90),
('5599WE','Chrisaan','10/30/2016',2000,'2019',1300),
('3009SA','Junie','04/21/2018',2000,'2018',5000)
select* from Invoice

insert into Contain values
('2234ER',21343,3),
('2434HG',12234,5),
('4432SD',226431,6),
('5599WE',53423,2),
('3009SA',667966,3)

select* from Contain
drop table Contain

insert into member(mem_Id,mailling,dob,fname,mname,lname) values(2211,'Corner','09/08/1994','Mikkel','Dwight','Davis')

create table Person
(
id int primary key,
fname varchar(20) not null,
lname varchar(20) not null
);

insert into Person(id,fname,lname)
select mem_Id,fname,lname from member

create table dummy_member
(
mem_Id int primary key,
mailling varchar(100) not null,
dob varchar(10) not null,
fname varchar (20) not null,
mname varchar(20) not null,
lname varchar(20) not null,
parish varchar(25) null
);

insert into dummy_member values
(1001,'Pamphret','05/05/1998','Ricardo','Shane','Johnson','St.Thomas'),
(2000,'Albion','30/12/1998','Chris','Jones','Clark','Kingston'),
(1002,'James','12/12/1978','Junie','Chris','John','St.James'),
(3221,'White Lane','31/09/1945','Gloria','Van','Cole','Hanova'),
(2110,'Albion','12/03/1996','Chrisann','Jones','Johnson','Portland')

update dummy_member set parish='Kingston'
update Employee set lname='Start' where emp_id='2013'
update product set category='Electronics'where category='small'
update member set fname='Jerome', lname='Thomas' where mailling='Albion'
update Employee set gender='Male',fname='John',lname='Smith' where parish='Portland'
update product set price =price*(price*0.10) where price between 0 and 49

select* from product
delete from dummy_member where mem_Id=3221
delete from dummy_member where lname='Johnson'
delete from dummy_member where parish='St.Ann' and lname='Brown'


alter table Employee
add supervisor_id varchar(15)

alter table Employee
add constraint Fk_supervisor foreign key (supervisor_id) references Employee(emp_id) 

update Employee set supervisor_id='2010' where emp_id='2013' or emp_id='2019' or emp_id='2017' or emp_id='2018'
select* from Employee
update product set manu_id = '1990' where code ='21343' or  code ='12234'

/* Lab Manual 3*/
select* from member
select* from M_phone
select* from product
select* from Employee
select* from Invoice
select* from Contain
select* from Person
select* from dummy_member

select fname,mname,lname from member 
select mem_Id,phone_number from M_phone
select code, price, inventory from product
select emp_id, gender, date_started from Employee

select mname, lname, fname from member
select phone_number, mem_Id from M_phone
select price,inventory,code from product
select date_started, gender, emp_id from Employee

select* from product
where price =300
select * from product
where price between 1000 and 2000
select * from product
where price >5000
select *from member
where parish= 'St. Catherine' or parish='Kingston' or parish ='St.Andrew'
select fname,lname from member
where parish= 'St. Catherine' or parish='Kingston' or parish ='St.Andrew'
select * from Employee
where not (lname='Allen') and not (parish='Kingston') or not (parish='St. Catherine') or not (parish ='St.Andrew')

select * from member
order by lname desc,fname asc,mailling desc

select * from product
order by price asc, code desc

select *from member
where parish= 'St. Catherine' or parish='Kingston' or parish ='St.Andrew'
order by parish asc,lname desc, fname asc 

select * from member
order by dob asc, lname,fname

select * ,(price*.165)as GCT from product 
select *,(price*4) as TotalValue from product

select * from member
where parish not like 'St.%'
select * from member
where parish like '%an%'
select* from product
where code like '1%'

select count(*) as totalmember from member
select avg(price*7) as cost from product
select max(price) as maximum from product
select min(price) as minimum from product
select sum(price) as total from product
select COUNT(*) as allProduct from product

select COUNT(emp_id),parish
from Employee
group by parish
 
select COUNT(mem_Id),parish
from member
group by parish

select count (code), price 
from product 
group by price

create table Manufacturer
(
manu_id varchar(15) primary key,
fname varchar(15) not null,
lname varchar(15) not null,
sales_rep varchar (10) null,
trading_add varchar (50) not null,
parish varchar (20) not null
);

alter table product
add manu_id varchar(15)

alter table product
add constraint FK_manu_id foreign key (manu_id) references product(code)

insert into Manufacturer values
('2009','Shane','Jones','James','Newland lane','St.Ann'),
('1120','Kahl','El','Ricky','Market Road','St.Mary'),
('3001','Natalia','Davis','Joe','Albion','St.Thomas'),
('1990','Gloria','Cole','Black','Golden Grove','Portland'),
('1122','Patrick','James','Rojeda','King Street','Kingston')

select *
from member
inner join Invoice
on member.mem_Id=Invoice.member_id

select member.fname,member.mname,member.lname,Invoice.date
from member 
inner join Invoice 
on member.mem_Id= Invoice.member_id

alter table member
add gender varchar (10)
update member set gender= 'female' where mem_Id=1002 or mem_Id=3221 or mem_Id=2110

/* Lab Manual 4*/
select member.fname,member.mname,member.lname,Invoice.date
from member 
inner join Invoice 
on member.mem_Id= Invoice.member_id
where gender='female'

select *
from Invoice
inner join Contain
on Invoice.invoice#=Contain.invoice#
inner join product
on Contain.code=product.code
inner join Manufacturer
on product.manu_id=Manufacturer.manu_id

select *
from Invoice
inner join Contain
on Invoice.invoice#=Contain.invoice#
inner join product
on Contain.code=product.code
where Invoice.invoice# = '2234ER'

select *
from Invoice
inner join Contain
on Invoice.invoice#=Contain.invoice#
inner join product
on Contain.code=product.code
group by quantity , sum(price)

select *
from Employee
inner join Invoice
on Employee.emp_id=Invoice.emp_id
inner join member
on Invoice.member_id=member.mem_Id
where member.parish ='Kingston'

select member.fname,member.lname,member.mem_Id, Invoice.invoice#,Invoice.date
from member
inner join Invoice
on member.mem_Id=Invoice.member_id

select member.fname,member.lname,member.mem_Id, Invoice.invoice#,Invoice.date
from member
left join Invoice
on member.mem_Id=Invoice.member_id

select *
from member
left join Invoice
on member.mem_Id=Invoice.member_id
where invoice# is  null

select *
from product 
left join Contain
on product.code=.Contain.code
where not Contain.code is not null

select *
from member
right join Invoice
on member.mem_Id=Invoice.member_id
where invoice# is  null

select *
from product 
right join Contain
on product.code=.Contain.code
where not Contain.code is not null

/* the results are not the same */

/* In order to get the same result you need to change around tables*/ 
select *
from Invoice
right join member
on member.mem_Id=Invoice.member_id
where invoice# is  null

select *
from Contain 
right join product
on product.code=.Contain.code
where not Contain.code is not null

select *
from member
full join Invoice
on member.mem_Id=Invoice.member_id
where invoice# is  null

select *
from product 
full join Contain
on product.code=.Contain.code
where not Contain.code is not null
/* Yes they are the same as 2.4 and 2.5*/ 

/*Lab Manual 5*/
select member.fname,member.lname,Invoice.invoice#
from member 
inner join (select* from Invoice where Invoice.emp_id= '2013' or Invoice.emp_id='2018')Invoice
on member.mem_Id=Invoice.member_id

select *
from Invoice
inner join member
on Invoice.member_id=member.mem_Id
where lname='Johnson'

select * 
from Invoice
inner join (select * from member  where fname like 'J%' and parish ='Kingston')member
on Invoice.member_id=member.mem_Id

select e.fname,e.lname,p.price
from Employee e
inner join Invoice i
on e.emp_id=i.emp_id
inner join Contain c
on i.invoice# = c.invoice#
inner join (select * from product where price > 500)p
on c.code=p.code

select fname,lname from member where mem_Id in(select member_id from Invoice where total > 500)
select * from Invoice where emp_id in (select emp_id from Employee where lname='Jones')
select discription,code,category from product where price <= 90
select date,cashier from Invoice where invoice# in(select invoice# from Contain where code in(select code from product where price >1500))
select fname,lname from Employee where emp_id in(select emp_id from Invoice where member_id in (select mem_id from member where lname='Thomas'))

select s.fname as Employee, e.fname as supervisor from Employee s inner join Employee e on s.supervisor_id=e.emp_id

/*Lab Manual 6*/
select fname,lname , datediff(year,dob,getdate()) as age from member
select *  from member where month(dob)=9
select * from member where year(dob)>25 and year(dob)<30

select * from member where month (dob)>=3 and month (dob)<=4


select * 
from member 
inner join Invoice
on member.mem_Id=Invoice.member_id
where month (date)>6


select fname, lname ,datediff(year,dob,getdate()) as age
from Employee
where dateadd(year,5,getdate())
in
(select datediff(year,dob,getdate() )from Employee)


CREATE TABLE PPL
(
Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) NOT NULL,
Marital_Status char(1) DEFAULT 'S',
Address varchar(255),
Email varchar(255),
Parish varchar(50),
CONSTRAINT chk_Person CHECK (Id>0 AND Parish in ('Kingston','St. Cathrine','Portland','St.
Andrew')),
Constraint chk_Person_Marital CHECK (Marital_status ='S' or Marital_Status='M'),
Constraint uk_email Unique (Email),
Primary Key (ID)
);

insert into PPL values(120,'Jones','Shane','S','New Road','baba199811@gmail.com','Manchester')
/*An error occur*/
/*yes*/
/*Msg 547, Level 16, State 0, Line 516
The INSERT statement conflicted with the CHECK constraint "chk_Person". The conflict occurred in database "Supermarket1702583", table "dbo.PPL"*/
insert into PPL(Id,LastName,FirstName,Address,Email,Parish) values (222,'jj','yy','road','riv@hotmail.com','Kingston')
select*from PPL
/*S was put in place*/
insert into PPL values
(120,'Jones','Shane','S','New Road','baba199811@gmail.com','Kingston'),
(220,'James','Rick','S','White Road','baba199811@gmail.com','St. Cathrine')
/*Email can't be same because it is a unique key*/