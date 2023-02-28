CREATE TABLE schools (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(50)
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(30),
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(60),
    publisher VARCHAR(30)
);

CREATE TABLE loan_books (
    loan_id INT PRIMARY KEY,
    school_id INT,
    teacher_id INT,
    course VARCHAR(40),
    room VARCHAR(10),
    grade VARCHAR(15),
    book_id INT,
    loanDate DATE,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)    
);
INSERT INTO schools VALUES
(1, 'Horizon Education Institute'),
(2, 'Bright Institution');

INSERT INTO teachers VALUES
(1, 'Chad Russell', 1),
(2, 'E.F.Codd', 1),
(3, 'Jones Smith', 1),
(4, 'Adam Baker', 2);

INSERT INTO books VALUES
(1, 'Learning and teaching in early childhood education', 'BOA Editions'),
(2, 'Preschool, N56', 'Taylor & Francis Publishing'),
(3, 'Early Childhood Education N9', 'Prentice Hall'),
(4, 'Know how to educate: guide for Parents and Teachers', 'McGraw Hill');

INSERT INTO loan_books VALUES 
(1, 1, 1, 'Logical Thinking', '1.A01', '1st grade', 1, '2010-09-09'),
(2, 1, 1, 'Writing', '1.A01', '1st grade', 2, '2010-05-05'),
(3, 1, 1, 'Numerical thinking', '1.A01', '1st grade', 1, '2010-05-05'),
(4, 1, 2, 'Spatial, Temporal and Causal Thinking', '1.B01', '1st grade', 3, '2010-05-06'),
(5, 1, 2, 'Numerical thinking', '1.B01', '1st grade', 1, '2010-05-06'),
(6, 1, 3, 'Writing', '1.A01', '2nd grade', 1, '2010-09-09'),
(7, 1, 3, 'English', '1.A01', '2nd grade', 4, '2010-05-05'),
(8, 2, 4, 'Logical Thinking', '2.B01', '1st grade', 4, '2010-12-18'),
(9, 2, 4, 'Numerical Thinking', '2.B01', '1st grade', 1, '2010-05-06');


-- QUEUES 
SELECT school_name, publisher, COUNT(*) AS num_books_loaned
FROM schools
JOIN teachers ON schools.school_id = teachers.school_id
JOIN loan_books ON teachers.teacher_id = loan_books.teacher_id
JOIN books ON loan_books.book_id = books.book_id
WHERE schools.school_id = loan_books.school_id
GROUP BY schools.school_name, books.publisher
ORDER BY schools.school_name ASC, num_books_loaned DESC;

SELECT school_name, book_name, teacher_name, MIN(loanDate) AS loan_date
FROM schools
JOIN teachers ON schools.school_id = teachers.school_id
JOIN loan_books ON teachers.teacher_id = loan_books.teacher_id
JOIN books ON loan_books.book_id = books.book_id
WHERE schools.school_id = loan_books.school_id
GROUP BY schools.school_name, books.book_name, teachers.teacher_name
ORDER BY schools.school_name ASC, loan_date ASC;
