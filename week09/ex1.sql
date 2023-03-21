CREATE FUNCTION get_addresses_with_11()
    RETURNS TABLE
            (
                address_id INTEGER,
                city       VARCHAR(30),
                address    VARCHAR(30)
            )
AS
$$
BEGIN
    RETURN QUERY SELECT a.address_id, c.city, a.address
                 FROM address a
                          JOIN city c ON a.city_id = c.city_id
                 WHERE a.address LIKE '%11%'
                   AND c.city_id BETWEEN 400 AND 600;
END;
$$ LANGUAGE plpgsql;

SELECT get_addresses_with_11();

ALTER TABLE address
    ADD COLUMN latitude FLOAT,
    ADD COLUMN longitude FLOAT;


SELECT * from address where address_id = 602;

UPDATE address SET latitude = 123, longitude = 123 WHERE address_id = 602