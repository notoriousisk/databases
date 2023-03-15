EXPLAIN ANALYZE SELECT (ID,Name,Address,review) FROM customer;

CREATE INDEX id_index ON customer(id);
CLUSTER customer USING id_index;
EXPLAIN ANALYZE SELECT (ID,Name,Address,review) FROM customer;

CREATE INDEX name_index ON customer USING hash (name);
EXPLAIN ANALYZE SELECT (ID,Name,Address,review) FROM customer;

