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



SELECT fname ||' '|| lname AS name, salary, 'Honest' AS honesty FROM candidate_shinh WHERE salary < 50000
UNION
SELECT fname ||' '|| lname AS name, salary, 'Not So Honest' AS honesty FROM candidate_shinh WHERE salary >= 50000 AND salary <= 100000
UNION
SELECT fname ||' '|| lname AS name, salary, '80000' AS honesty FROM candidate_shinh WHERE salary > 100000 ORDER BY 1;

SELECT fname ||' '|| lname AS name, CASE WHEN salary < 50000 THEN 'Honest'
                                         WHEN salary >= 50000 AND salary <= 100000 THEN 'Not So Honest'
                                         WHEN salary > 100000 THEN '80000'
                                         ELSE 'Does Not Apply'
                                    END AS honesty
                                    FROM candidate_shinh;
                                    
SELECT fname ||' '|| lname AS name FROM candidate_shinh WHERE NVL(partyid, -1) NOT IN (SELECT partyid FROM party_shinh);   

SELECT fname ||' '|| lname AS name FROM candidate_shinh c WHERE NOT EXISTS (SELECT * FROM party_shinh p WHERE c.partyid = p.partyid);

SELECT fname ||' '|| lname AS name FROM candidate_shinh 
MINUS
SELECT fname ||' '|| lname AS name FROM candidate_shinh WHERE partyid IN (SELECT partyid FROM party_shinh);