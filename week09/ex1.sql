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


CREATE FUNCTION get_addresses_with_11_with_lat_lon()
    RETURNS TABLE
            (
                address_id INTEGER,
                city       VARCHAR(30),
                address    VARCHAR(30),
                longitude FLOAT,
                latitude FLOAT
            )
AS
$$
BEGIN
    RETURN QUERY SELECT a.address_id, c.city, a.address, a.longitude, a.latitude
                 FROM address a
                          JOIN city c ON a.city_id = c.city_id
                 WHERE a.address LIKE '%11%'
                   AND c.city_id BETWEEN 400 AND 600;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_addresses_with_11_with_lat_lon()