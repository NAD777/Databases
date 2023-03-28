CREATE TABLE account
(
    username VARCHAR(50) NOT NULL,
	fullname VARCHAR(50) NOT NULL,
    balance  FLOAT       NOT NULL,
    group_id INT         NOT NULL,
);

INSERT INTO account (id, username, fullname, balance, group_id)
VALUES ('jones', 'Alice Jones', 82, 1),
	   ('bitdidl', 'Ben Bitdiddle', 65, 1),
	   ('mike', 'Michael Dole', 73, 2),
	   ('alyssa', 'Alyssa P.Hacker', 79, 3),
	   ('bbrown', 'Bob Brown', 100, 3);


