-- 1. View the order details table

SELECT *
FROM order_details;

-- 2. What is the date range of the table?      # the date range is from 2023-01-01 to 2023-03-31

SELECT MIN(order_date), MAX(order_date) 
FROM order_details;


-- 3. How many orders were made within this date range?   # the number of orders = 5370

SELECT  count(DISTINCT(order_id))
FROM order_details;



-- 4. How many items were ordered within this date range?     # the number of ordered items = 12234

SELECT count(*)
FROM order_details;

-- 5. Which order had the most number of items?    # the order that has the most number of items = (4305, 3473, 1957, 330, 440, 443, 2675)

SELECT  order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC ;

-- 6. How many orders had more than 12 items?     # the number of orders that more than 12 items = 20

SELECT COUNT(*)
FROM
(SELECT  order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
Having num_items > 12) AS num_orders;
