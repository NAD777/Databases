BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM account;


SELECT * FROM account;
-- First console shows 'jones', second shows 'ajones'. So, the inpormation is not the same

BEGIN TRANSACTION;
UPDATE account SET balance = balance + 10 WHERE fullname = 'Alice Jones';

COMMIT;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SAVEPOINT pt1;

SELECT * FROM acccount WHERE group_id = 2;

UPDATE acccount SET balance = balance + 15 WHERE group_id = 2;

COMMIT;

-- In both instances, after the account has been moved to the second group, the first console only displays one person in the second group.
