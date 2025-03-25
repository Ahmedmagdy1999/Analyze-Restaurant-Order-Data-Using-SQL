-- 1.Combine the menu items table and orders details table in a single table

SELECT *
FROM menu_items;

SELECT *
FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id;

-- 2.What were the least and most ordered items? What category were they in?

SELECT item_name, COUNT(order_details_id) AS num_of_purchase, category
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name,category
ORDER BY num_of_purchase;


-- 3.What were the top 5 orders that spent the most money?

SELECT order_id, SUM(price) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

-- 4.View the details of the highest spend order. What insights can I gather from the result?     # We should keep those expensive italian dishes on becasue it's the most spent orders

SELECT category, COUNT(item_id) AS num_of_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;    
    
    
-- 5.View the details of the top 5 highest spend orders. What insights can I gather from the result?        # We should keep those expensive italian dishes on the menu beacse people seem to puchase them them most 

SELECT  order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id in (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category
;  

