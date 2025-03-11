drop sequence salary;
drop table candidate_shinh;
drop table party_shinh;
Create sequence salary start with 20000 increment by 10000;

create table party_shinh
(
partyid number primary key,
partydesc varchar2(20)
);

insert into party_shinh
values(1,'Democrat');
insert into party_shinh
values(2,'Republican');
insert into party_shinh
values(3,'Independent');
insert into party_shinh
values(4,'');

create table candidate_shinh
(
lname varchar(40) not null,
fname varchar(20) not null,
address varchar(20),
salary number,
dob date,
partyid number references party_shinh
);

insert into candidate_shinh
values('jennet', 'abraham', 'Berkeley, CA.', salary.nextval, '01 feb
1960',1);
insert into candidate_shinh
values ( 'Green', 'abraham', 'Oakland, CA.',salary.nextval, '01 feb
1964',1 );
insert into candidate_shinh
values('gren', 'cheryl','Berkeley, CA.',null,'01 feb 1968',2 );
insert into candidate_shinh
values('greeenr', 'albert', 'Salt Lake City, UT', salary.nextval, '01 feb
1970',2);
insert into candidate_shinh
values('gran', 'anne', 'Salt Lake City, UT', salary.nextval, '01 feb
1961',3 );
insert into candidate_shinh
values('mama', 'mia', 'pepper City, UT', salary.nextval, '01 feb
1968',null );
commit;




SELECT partyid, COUNT(*) AS "Number of People" FROM candidate_shinh GROUP BY partyid;

SELECT partyid, COUNT(*) AS "Number of People"  FROM candidate_shinh WHERE INITCAP(fname) LIKE 'D%' OR INITCAP(fname) LIKE 'R%'  GROUP BY partyid;

SELECT partyid, avg(salary), COUNT(*) AS "Number of People" FROM candidate_shinh GROUP BY partyid;

SELECT partyid, COUNT(*) AS "Number of People" FROM candidate_shinh GROUP BY partyid HAVING COUNT (*) < 3;

SELECT partyid, avg(salary), COUNT(*) AS "Number of People" FROM candidate_shinh GROUP BY partyid HAVING avg(salary) <= 50000;

CREATE TABLE candidate_shinh_2 AS SELECT partyid, COUNT(*) AS "Number of People" FROM candidate_shinh GROUP BY partyid;
