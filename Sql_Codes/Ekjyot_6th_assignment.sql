DROP TABLE shinh_student;
CREATE TABLE shinh_student
(
	SSN		CHAR(9) CONSTRAINT shinh_student_SSN_pk PRIMARY KEY,
	lname	VARCHAR(20),
	fname	VARCHAR(20),
    DOB		DATE,
	salary	NUMBER CHECK(salary > 10000),
    CONSTRAINT shinh_student_name_uk UNIQUE(fname,lname)
);


DROP TABLE shinh_class;
CREATE TABLE shinh_class
(
	class_code		    NUMBER PRIMARY KEY,
	class_description	VARCHAR(20) 
);

CREATE INDEX shinh_class_idx ON shinh_class(class_description);


DROP TABLE shinh_student_class;
CREATE TABLE shinh_student_class
(
    class_code NUMBER,
    SSN        CHAR(9),
    CONSTRAINT shinh_student_class_class_code_fk FOREIGN KEY (class_code) REFERENCES shinh_class(class_code),
    CONSTRAINT shinh_student_class_SSN_fk FOREIGN KEY (SSN) REFERENCES shinh_student(SSN),
    CONSTRAINT shinh_student_class_class_class_pk PRIMARY KEY (class_code,SSN)
);

INSERT INTO shinh_class VALUES(1, 'Math');
INSERT INTO shinh_class VALUES(2, 'Science');

INSERT INTO shinh_student VALUES('123456789','Bly', 'Cam',TO_DATE('01/28/01','yy/dd/mm'), 23423459);
INSERT INTO shinh_student VALUES('987654321','David', 'Tim','22/AUG/2000', 3462907);

INSERT INTO shinh_student_class VALUES(1,'123456789' );
INSERT INTO shinh_student_class VALUES(2,'123456789' );
INSERT INTO shinh_student_class VALUES(2,'987654321' );

INSERT INTO shinh_student VALUES('123456789','Blakey', 'Camming','22/AUG/2003', 34256234);

INSERT INTO shinh_student VALUES('897654321','David', 'Tim','22/AUG/2005', 3246356);

INSERT INTO shinh_student VALUES('213456789','time', 'pass','22/AUG/2007', 90);

INSERT INTO shinh_student_class VALUES(9,'123456789' );

INSERT INTO shinh_student_class VALUES(2,'999999999' );

INSERT INTO shinh_student_class VALUES(1,'123456789' );


ALTER TABLE shinh_student_class DISABLE CONSTRAINT shinh_student_class_SSN_fk;

INSERT INTO shinh_student_class VALUES(1,'999999999' );

ALTER TABLE shinh_student_class ENABLE CONSTRAINT shinh_student_class_SSN_fk;


DELETE FROM shinh_student_class;

TRUNCATE TABLE shinh_student;

DROP INDEX shinh_class_idx;

ALTER TABLE shinh_student_class DROP CONSTRAINT shinh_student_class_class_code_fk;
ALTER TABLE shinh_student_class DROP CONSTRAINT shinh_student_class_SSN_fk;

DROP TABLE shinh_student;