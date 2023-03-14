-- I have INSERTED 999918 rows in db

-- 3 queries
explain SELECT id FROM customer
WHERE name = 'Emily Garcia';
-- Result: Gather  (cost=1000.00..36524.91 rows=10 width=4)

explain SELECT name FROM customer
WHERE id = 787049;
-- Result: Index Scan using customer_pkey on customer  (cost=0.42..8.44 rows=1 width=14)

explain SELECT address
FROM customer
WHERE name LIKE 'Mary%';
-- Result: Gather  (cost=1000.00..36553.71 rows=298 width=44)

-- To create Btree index on 'id' we need to do following 
CREATE INDEX idx_customer_id ON customer(id); -- by default it will create Btree

-- To create hash index on 'name'
CREATE INDEX idx_customer_name ON customer USING hash (name);


-- 3 queries after indexing
explain SELECT id FROM customer
WHERE name = 'Emily Garcia';
-- Result: Bitmap Heap Scan on customer  (cost=4.08..43.66 rows=10 width=4)

explain SELECT name FROM customer
WHERE id = 787049;
-- Result: Index Scan using idx_customer_id on customer  (cost=0.42..8.44 rows=1 width=14)

explain SELECT address
FROM customer
WHERE name LIKE 'Mary%';
-- Result: Gather  (cost=1000.00..36553.71 rows=298 width=44)

-- We can see the difference in result after indexing. After indexing consuming time of queries decrease, which is great!!