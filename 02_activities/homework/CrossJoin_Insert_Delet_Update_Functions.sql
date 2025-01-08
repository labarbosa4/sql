-- CROSS JOIN

WITH total_customers AS (
    SELECT COUNT(*) AS customer_count FROM customer
)

SELECT 
    v.vendor_name, 
    p.product_name, 
    SUM(5 * vi.original_price * tc.customer_count) AS total_revenue_per_product
FROM vendor_inventory vi
JOIN vendor v ON vi.vendor_id = v.vendor_id
JOIN product p ON vi.product_id = p.product_id
CROSS JOIN total_customers tc
GROUP BY v.vendor_name, p.product_name;


-- INSERT 

CREATE TABLE product_units AS
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE 1 = 0; 


INSERT INTO product_units
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE product_qty_type = 'unit';

INSERT INTO product_units (product_id, product_name, product_size, product_category_id,product_qty_type, snapshot_timestamp)
VALUES (101, 'Blackberry Pie', 'Medium',3, 'unit', CURRENT_TIMESTAMP);


-- DELETE

SELECT *
FROM product_units
WHERE product_name ='Blackberry Pie';

SELECT rowid, snapshot_timestamp
FROM product_units
WHERE product_name = 'Blackberry Pie'
ORDER BY snapshot_timestamp ASC
LIMIT 1;

DELETE FROM product_units
WHERE product_name = 'Blackberry Pie'
AND snapshot_timestamp = '2024-09-21 20:47:57';  


-- UPDATE

ALTER TABLE product_units
ADD current_quantity INT;

UPDATE product_units
SET current_quantity = (
    SELECT COALESCE(v.quantity, 0)
    FROM vendor_inventory v
    WHERE v.product_id = product_units.product_id
    ORDER BY v.market_date DESC  
    LIMIT 1
)
WHERE product_units.product_id IN (
    SELECT DISTINCT product_id FROM vendor_inventory
);

