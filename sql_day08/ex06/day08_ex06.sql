-- SESSION # 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SESSION # 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SESSION # 1
SELECT SUM(rating)
FROM pizzeria;
-- SESSION # 2
INSERT INTO pizzeria
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- SESSION # 1
SELECT SUM(rating)
FROM pizzeria;
COMMIT;
SELECT SUM(rating)
FROM pizzeria;
-- SESSION # 2
SELECT SUM(rating)
FROM pizzeria;