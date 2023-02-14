CREATE TABLE Specialization(
  name VarChar(30) Primary Key
);

CREATE TABLE Student(
  id Integer Primary Key,
  name VarChar(30), 
  native_language VarChar(30)
);

CREATE TABLE Course(
  name VarChar(30) Primary Key, 
  credits Integer
);

CREATE TABLE Takes(
  SpecName VarChar(30)NOT NULL REFERENCES Specialization(name),
  PersonID Integer NOT NULL REFERENCES Student(id)
);

CREATE TABLE Enroll(
  CourseName VarChar(30) NOT NULL REFERENCES Course(name),
  PersonID Integer NOT NULL REFERENCES Student(id)
);

INSERT INTO Specialization VALUES ("SD");
INSERT INTO Specialization VALUES ("Cyber");
INSERT INTO Specialization VALUES ("Rocket");
INSERT INTO Specialization VALUES ("Robotics");

INSERT INTO Student VALUES (1, "Anton", "Russian");
INSERT INTO Student VALUES (2, "Buba", "English");
INSERT INTO Student VALUES (3, "Sanya", "Russian");
INSERT INTO Student VALUES (4, "Kuka", "English");
INSERT INTO Student VALUES (5, "Pipa", "German");
INSERT INTO Student VALUES (6, "JAJA", "Pakistanski");
INSERT INTO Student VALUES (7, "Pupa", "France");
INSERT INTO Student VALUES (8, "Popo", "Russian");
INSERT INTO Student VALUES (9, "Vladick", "Russian");
INSERT INTO Student VALUES (10, "Gera", "Turkish");
INSERT INTO Student VALUES (11, "Sonia", "Russian");
INSERT INTO Student VALUES (12, "Elina", "Russian");

INSERT INTO Course VALUE ("ML", 3);
INSERT INTO Course VALUE ("Physics", 1);
INSERT INTO Course VALUE ("C++", 1);

INSERT INTO Takes VALUE ("SD", 1);
INSERT INTO Takes VALUE ("Robotics", 2);
INSERT INTO Takes VALUE ("Cyber", 3);
INSERT INTO Takes VALUE ("Robotics", 4);

INSERT INTO Enroll VALUES ("C++", 1);
INSERT INTO Enroll VALUES ("C++", 4);

