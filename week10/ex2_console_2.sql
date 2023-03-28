BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE account SET username = 'ajones' WHERE fullname = 'Alice Jones';
SELECT * FROM account;

COMMIT;

BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
UPDATE account SET balance = balance + 20 WHERE fullname = 'Alice Jones';
ROLLBACK;
COMMIT;
-- When attempting to commit changes with READ UNCOMMITTED or REPEATABLE READ isolation levels, an infinite read may occur.

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SAVEPOINT pt1;

SELECT * FROM acccount WHERE group_id = 2;

UPDATE acccount SET group_id = 2 WHERE fullname = 'Bob Brown';

SELECT * FROM acccount WHERE group_id = 2;

COMMIT;



