CREATE TABLE accounts
(
    id       INT         NOT NULL,
    name     VARCHAR(50) NOT NULL,
    credit   FLOAT       NOT NULL,
    currency VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO accounts (id, name, credit, currency)
VALUES (1, 'Account 1', 1000, 'Rub'),
       (2, 'Account 2', 1000, 'Rub'),
       (3, 'Account 3', 1000, 'Rub');

ALTER TABLE accounts
ADD BankName VARCHAR(30);

UPDATE accounts SET bankname = 'SberBank' WHERE id = 1;
UPDATE accounts SET bankname = 'Tinkoff' WHERE id = 2;
UPDATE accounts SET bankname = 'SberBank' WHERE id = 3;


INSERT INTO accounts (id, name, credit, currency, bankname)
VALUES (4, 'Account 4', 0, 'Rub', 'Tinkoff');



CREATE TABLE Ledger (
  ID INT PRIMARY KEY,
  "From" INT NOT NULL REFERENCES accounts (id),
  "To" INT NOT NULL REFERENCES accounts (id),
  Fee FLOAT NOT NULL,
  Amount FLOAT NOT NULL,
  TransactionDateTime TIMESTAMP NOT NULL
);

commit;


BEGIN;

--
SAVEPOINT pt1;
UPDATE accounts
SET credit = credit - 500
WHERE id = 1;

UPDATE accounts
SET credit = credit + 500
WHERE id = 3;

UPDATE accounts
SET credit = credit + 30
WHERE id = 4;

INSERT INTO Ledger VALUES (1, 1, 3, 30, 500, current_timestamp);

--
SAVEPOINT pt2;
UPDATE accounts
SET credit = credit - 700
WHERE id = 2;

UPDATE accounts
SET credit = credit + 670
WHERE id = 1;

UPDATE accounts
SET credit = credit + 30
WHERE id = 4;

INSERT INTO Ledger VALUES (2, 2, 1, 30, 700, current_timestamp);
--
SAVEPOINT pt3;
UPDATE accounts
SET credit = credit - 100
WHERE id = 2;

UPDATE accounts
SET credit = credit + 70
WHERE id = 3;

UPDATE accounts
SET credit = credit + 30
WHERE id = 4;

INSERT INTO Ledger VALUES (3, 2, 3, 30, 100, current_timestamp);

--

ROLLBACK TO pt1;

SELECT * FROM Ledger;

