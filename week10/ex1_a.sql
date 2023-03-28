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

BEGIN;
SAVEPOINT pt1;
UPDATE accounts
SET credit = credit - 500
WHERE id = 1;

UPDATE accounts
SET credit = credit + 500
WHERE id = 3;


SAVEPOINT pt2;
UPDATE accounts
SET credit = credit - 700
WHERE id = 2;

UPDATE accounts
SET credit = credit + 700
WHERE id = 1;


SAVEPOINT pt3;
UPDATE accounts
SET credit = credit - 100
WHERE id = 2;

UPDATE accounts
SET credit = credit + 100
WHERE id = 3;

SELECT * FROM accounts;

ROLLBACK TO pt1;

SELECT * FROM accounts;
