DROP DATABASE IF EXISTS UNIVERSITY;
CREATE DATABASE UNIVERSITY;
use university;
CREATE TABLE STUDENT(
SID VARCHAR(10),
FN VARCHAR(20),
LN VARCHAR(20),
BDate Date,
Sex ENUM('M','F','O'),
class varchar(10),
Degree_Program varchar(10),
C_Address TEXT,
C_Phone BIGINT,
P_Phone BIGINT,
City varchar(10),
State varchar(10),
ZIP int,
Major_Dep varchar(20),
Minor_Dep varchar(20),
CONSTRAINT PK_SID_STUDENT PRIMARY KEY(SID)
);

CREATE TABLE DEPARTMENT(
DName varchar(20),
Department_Code varchar(10),
College varchar(25),
OfficeNo int,
OfficePhone BIGINT,
CONSTRAINT PK_DNAME_DEPARTMENT PRIMARY KEY(DName)
);

ALTER TABLE STUDENT 
  ADD CONSTRAINT fk_major FOREIGN KEY (Major_Dep) REFERENCES DEPARTMENT(DName),
  ADD CONSTRAINT fk_minor FOREIGN KEY (Minor_Dep) REFERENCES DEPARTMENT(DName);


CREATE TABLE COURSE(
CNumber bigint,
CName varchar(20),
Course_Description TEXT,
Hours time,
Course_Level int,
Dep varchar(20),
CONSTRAINT PK_COURSE_CNumber PRIMARY KEY(CNumber),
CONSTRAINT FK_Dep_course foreign key(Dep) references Department(DName)
);

CREATE TABLE SECTION(
SecNum int,
Section_Year year,
Semester int,
Instructor varchar(20),
Course bigint,
CONSTRAINT PK_SECTION PRIMARY KEY(SecNum,Section_Year,Semester,Course),
CONSTRAINT FK_COURSE_SECTION FOREIGN KEY(Course) references COURSE(CNumber)
);

CREATE TABLE GRADE_REPORT(
LetterGrade char,
NumericGrade int,
CONSTRAINT PK_GRADE_REPORT PRIMARY KEY (NumericGrade)
);

CREATE TABLE STUDENT_GRADES(
Student varchar(10),
CourseNo bigint,
Section int,
Semester int,
Section_Year year,
Grade int,
constraint fk_stud foreign key(Student) references STUDENT(SID),
constraint fk_student_grades foreign key(Section,Section_Year,Semester,CourseNo)
references SECTION(SecNum,Section_Year,Semester,Course),
-- constraint fk_course foreign key(CourseNo) references SECTION(Course),
-- constraint fk_section foreign key(Section) references SECTION(SecNum),
-- constraint fk_year foreign key (Section_Year) references SECTION(Section_Year),
-- constraint fk_Semester foreign key(Semester) references SECTION(Semester), 
constraint fk_grade foreign key (Grade) references GRADE_REPORT(NumericGrade),
constraint pk_student_grades primary key(Student,CourseNo,Section,Semester,Section_Year,Grade)
);