DROP TABLE shinh_candidate;
CREATE TABLE shinh_candidate
(
    fname   VARCHAR(20),
    lname   VARCHAR(20),
    dob     DATE,
    salary  NUMBER,
    ssn     CHAR(9), 
    PRIMARY KEY(ssn), 
    UNIQUE (fname, lname) 
);

DROP TABLE shinh_party;
CREATE TABLE shinh_party
(
    party_disc  VARCHAR(20),
    party_ID    NUMBER PRIMARY KEY
);


ALTER TABLE shinh_candidate 
MODIFY salary CONSTRAINT shinh_candidate_salary_ck CHECK(salary > 10000 AND salary < 50000);

ALTER TABLE shinh_party 
MODIFY party_disc NOT NULL;

ALTER TABLE shinh_candidate DISABLE CONSTRAINT shinh_candidate_salary_ck;

ALTER TABLE shinh_candidate ADD candidate_party_ID NUMBER;
ALTER TABLE shinh_candidate ADD CONSTRAINT 
shinh_candidate_candidate_party_ID_fk FOREIGN KEY(candidate_party_ID) REFERENCES shinh_party(party_ID);

ALTER TABLE shinh_candidate
DISABLE CONSTRAINT shinh_candidate_candidate_party_ID_fk;

ALTER TABLE shinh_candidate
DROP CONSTRAINT shinh_candidate_candidate_party_ID_fk;


