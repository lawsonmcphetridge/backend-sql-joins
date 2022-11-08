-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
SELECT
    country.country,
    avg(payment.amount)
FROM
    country
    LEFT JOIN city on country.country_id = city.country_id
    LEFT JOIN address on city.city_id = address.city_id
    LEFT JOIN customer on customer.address_id = address.address_id
    LEFT JOIN payment on customer.customer_id = payment.customer_id
WHERE
    payment.amount is not null
GROUP BY
    country.country_id
ORDER BY
    avg desc
LIMIT
    10