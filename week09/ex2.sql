drop function retrieves_customers;

CREATE OR REPLACE FUNCTION retrieves_customers(start INTEGER, "end" INTEGER) -- We can not use end as variable name
    RETURNS TABLE
            (
                customerId INTEGER,
                addressId SMALLINT,
                firstname  VARCHAR,
                lastname   VARCHAR,
                email_ VARCHAR
            )
AS
$$
BEGIN
    IF(NOT((0 <= start AND start < 600) AND (0 <= "end" AND "end" < 600) AND (start <= "end")))
    THEN
        raise EXCEPTION 'Something went wrong';
    end if;
    RETURN QUERY SELECT customer_id, address_id, first_name, last_name, email
    FROM customer
    WHERE address_id BETWEEN start AND "end"
    ORDER BY address_id;
END;
$$ LANGUAGE plpgsql;

SELECT retrieves_customers(10, 40);