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

SELECT fname
FROM candidate_shinh
WHERE partyid = (SELECT partyid FROM party_shinh WHERE INITCAP(partydesc) = 'Democrat');


SELECT partydesc
FROM party_shinh
WHERE partyid IN (
    SELECT partyid
    FROM candidate_shinh
    WHERE (UPPER(lname) LIKE '%C')
);


SELECT fname
FROM candidate_shinh
WHERE partyid IN (
    SELECT partyid
    FROM party_shinh
    WHERE UPPER(partydesc) IN ('DEMOCRAT', 'REPUBLICAN')
);


CREATE TABLE candidate2_shinh AS
SELECT 
    fname, 
    lname, 
    CASE 
        WHEN partyid = (SELECT partyid FROM party_shinh WHERE UPPER(partydesc) = 'REPUBLICAN') 
        THEN salary * 0.9 
        ELSE salary 
    END AS salary 
FROM candidate_shinh;

SELECT * from candidate2_shinh;
SELECT * from candidate_shinh;