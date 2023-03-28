BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE account SET username = 'ajones' WHERE fullname = 'Alice Jones';
SELECT * FROM account;

COMMIT;

BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
UPDATE account SET balance = balance + 20 WHERE fullname = 'Alice Jones';
ROLLBACK;
COMMIT;
-- while trying to commit the changes, the infinite read happens with
-- read (un)commited and repeatable read isolation levels.
