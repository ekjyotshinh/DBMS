DROP TABLE shinh_party;
CREATE TABLE shinh_party
(
    partyID    NUMBER,
    party_disc  VARCHAR(20),
    CONSTRAINT shinh_party_partyID_pk PRIMARY KEY (partyID),
    CONSTRAINT shinh_party_party_disc_uk UNIQUE (party_disc)
);

DROP TABLE shinh_candidate;
CREATE TABLE shinh_candidate
(
    candidateID NUMBER,
    fname       VARCHAR(20),
    lname       VARCHAR(20),
    dob         DATE,
    salary      NUMBER,
    partyID     NUMBER,
    CONSTRAINT shinh_candidate_candiateID_pk PRIMARY KEY(candidateID), 
    CONSTRAINT shinh_candidate_name_uk UNIQUE (fname, lname),
    CONSTRAINT shinh_candidate_salary_ck CHECK (salary > 10000 AND salary < 50000),
    CONSTRAINT shinh_candidate_candidate_partyID_fk FOREIGN KEY(partyID) REFERENCES shinh_party(partyID)

);


INSERT INTO shinh_party VALUES (11, 'COOL');
INSERT INTO shinh_party VALUES (22, 'HOT');

INSERT INTO shinh_candidate VALUES (1, 'Evan', 'Lewis', '31/OCT/99', '40957', '11');
INSERT INTO shinh_candidate VALUES (2, 'Nathan', 'Ellis', '03/SEP/98', '34095', '22');

INSERT INTO shinh_candidate VALUES (3, 'Matt', 'Short', TO_DATE('02/21/97','MM/DD/YY'), '34097', '11');
INSERT INTO shinh_candidate VALUES (4, 'Cool', 'Bro', TO_DATE('29/03/10','DD/YY/MM'), '40957', '22');

SELECT TO_CHAR(dob,'MM/DD/YYYY') FROM shinh_candidate;

SELECT TO_CHAR(dob,'DD/YYYY/MM hh12:mi:ss') FROM shinh_candidate;

INSERT INTO shinh_candidate VALUES (5, 'Darcy', 'Short', '30/SEP/98', '34586795095', '22');

INSERT INTO shinh_party VALUES (33, 'HOT');


SELECT constraint_name, r_constraint_name, constraint_type 
FROM user_constraints 
WHERE table_name = 'SHINH_CANDIDATE';


SELECT constraint_name, r_constraint_name, constraint_type 
FROM user_constraints
WHERE table_name = 'SHINH_PARTY';
