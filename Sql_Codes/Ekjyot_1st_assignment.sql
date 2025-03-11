CREATE TABLE shinh_candidate
(
    fname   VARCHAR(20),
    lname   VARCHAR(20),
    dob     DATE,
    salary  NUMBER
);

CREATE TABLE shinh_party
(
    party_disc  VARCHAR(20)
);

ALTER TABLE shinh_candidate DROP(dob);

ALTER TABLE shinh_candidate ADD dob DATE;

ALTER TABLE shinh_candidate ADD ssn CHAR(9);
ALTER TABLE shinh_candidate ADD PRIMARY KEY(ssn);

ALTER TABLE shinh_party ADD party_logo VARCHAR(20);
ALTER TABLE shinh_party ADD PRIMARY KEY(party_logo);

ALTER TABLE shinh_candidate ADD UNIQUE (fname,lname);

DROP TABLE shinh_party;
CREATE TABLE shinh_party
(
    party_disc  VARCHAR(20),
    party_logo  VARCHAR(20) PRIMARY KEY
);