CREATE OR REPLACE FUNCTION retrieve_customers(start_num INTEGER, end_num INTEGER)
RETURNS TABLE (customer_id INTEGER, first_name VARCHAR, last_name VARCHAR, address_id INTEGER) AS
$$
BEGIN
    IF start_num < 0 OR end_num < 0 OR start_num > 600 OR end_num > 600 THEN
        RAISE EXCEPTION 'Invalid parameters: start_num and end_num must be between 0 and 600.';
    END IF;
    
    RETURN QUERY
        SELECT c.customer_id, c.first_name, c.last_name, CAST(c.address_id AS INTEGER)
        FROM customer c
        ORDER BY c.address_id
        OFFSET start_num
        LIMIT (end_num - start_num + 1);
END;
$$
LANGUAGE plpgsql;


SELECT * FROM retrieve_customers(10,40);
