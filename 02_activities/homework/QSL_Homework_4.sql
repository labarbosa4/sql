-- 1. COALESCE 

SELECT 
product_name || ', ' || COALESCE(product_size, '') || ' (' || COALESCE(product_qty_type, 'unit') || ')' AS product_detail
FROM product;

-- 2. WIDOWED FUNCTIONS:

WITH RankedVisits AS (

    --  Number each customer's visits to the farmer's market, with the most recent visit labeled 1
	
    SELECT 
        customer_id, 
        market_date, 
        product_id,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY market_date DESC) AS visit_number,
		
        -- Count how many times each customer has purchased the same product (product_id)
		
        COUNT(*) OVER (PARTITION BY customer_id, product_id) AS count_product_purchase
    FROM customer_purchases
)

-- Filter the results to show only the customer's most recent visit

SELECT 
    customer_id, 
    market_date, 
    product_id, 
    visit_number, 
    count_product_purchase
FROM RankedVisits
WHERE visit_number = 1;




-- 3. STRING MANIPULATIONS

SELECT 
    product_name,
    -- Use INSTR to find the position of the hyphen and SUBSTR to capture the description after it
    CASE 
        WHEN INSTR(product_name, '-') > 0 
        THEN TRIM(SUBSTR(product_name, INSTR(product_name, '-') + 1)) 
        ELSE NULL 
    END AS description
FROM product;


--4. UNION

WITH sales_by_date AS (

    -- Calculate total sales for each market date
	
    SELECT 
        market_date, 
        SUM(quantity * cost_to_customer_per_qty) AS total_sales
    FROM customer_purchases
    GROUP BY market_date
),
ranked_sales AS (

    -- Rank the sales by market date, both in ascending and descending order
	
    SELECT 
        market_date, 
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS best_day_rank,
        RANK() OVER (ORDER BY total_sales ASC) AS worst_day_rank
    FROM sales_by_date
)

-- UNION to combine the highest and lowest sales days

SELECT 
    market_date, 
    total_sales, 
    'Best Day' AS day_type
FROM ranked_sales
WHERE best_day_rank = 1

UNION

SELECT 
    market_date, 
    total_sales, 
    'Worst Day' AS day_type
FROM ranked_sales
WHERE worst_day_rank = 1;


