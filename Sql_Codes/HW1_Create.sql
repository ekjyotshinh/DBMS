DROP TABLE shinh_student;
CREATE TABLE shinh_student
(
	SSN		CHAR(9) PRIMARY KEY,
	fname	VARCHAR(20),
	lname	VARCHAR(20),
	age		NUMBER,
	salary	NUMBER,
	DOB		NUMBER
);

ALTER TABLE shinh_student  ADD UNIQUE (fname,lname);

ALTER TABLE shinh_student ADD CONSTRAINTS shinh_student_age_ck
CHECK (age BETWEEN 10 AND 50);

ALTER TABLE shinh_student ADD address VARCHAR(50);

ALTER TABLE shinh_student MODIFY DOB DATE NOT NULL;

CREATE INDEX SSN_DOB ON shinh_student (SSN, DOB);


ALTER TABLE shinh_student ADD transferable char(1) NOT NULL;


ALTER TABLE shinh_student 
ADD CONSTRAINTS shinh_student_transferable_ck 
CHECK(transferable IN ('y', 'Y', 'N', 'n'));

ALTER TABLE shinh_student DROP (age);


DROP TABLE shinh_class;
CREATE TABLE shinh_class
(
	class_code		    NUMBER,
	class_description	VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE shinh_class 
MODIFY class_code CONSTRAINTS shinh_class_class_ID_pk PRIMARY KEY;

CREATE INDEX class_description ON shinh_class(class_description);



DROP TABLE shinh_student_class;
CREATE TABLE shinh_student_class
(
    class_code NUMBER,
    SSN        CHAR(9)
);
ALTER TABLE shinh_student_class
ADD CONSTRAINT student_class_pk PRIMARY KEY(class_code, SSN);

ALTER TABLE shinh_student_class
ADD CONSTRAINT shinh_student_class_SSN_fk FOREIGN KEY (SSN) 
REFERENCES shinh_student;


ALTER TABLE shinh_student_class
ADD CONSTRAINT shinh_student_class_class_code_fk FOREIGN KEY (class_code) 
REFERENCES shinh_class(class_code);