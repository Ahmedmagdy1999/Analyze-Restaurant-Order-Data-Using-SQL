use restaurant_db;

-- 1. View the menu items table 

SELECT *
FROM menu_items;

-- 2. Find the number of items on the menu   # the number of items on the menu = 32

SELECT COUNT(item_name) 
FROM menu_items;

select count(*)     #
from menu_items;

-- 3. What are the least and most expensive items on the menu?     # the most expensive item = Shrimp Scampi ,  the least expensive item = Edamame

SELECT item_name, price
FROM menu_items
ORDER BY price DESC;

SELECT item_name, price
FROM menu_items
ORDER BY price;

-- 4. How many italian dish are on the menu?   the number of italian dish in the menue is = 9

SELECT category, COUNT(item_name) AS item_count
FROM menu_items
WHERE category = "Italian"
GROUP BY category;


-- 5. What are the least and most expensive italian dish on the menu?     # the most expensive italian dish  = Eggplant Parmesan,  the least expensive italian dish = Spaghetti

SELECT item_name, price, category
FROM menu_items
WHERE category = 'Italian';


-- 6. How many dishes are in each category?        # the number of dishes in American=6, Asian=8, Mexican=9, Italian=9

SELECT category, COUNT(item_name) AS item_count
FROM menu_items
GROUP BY category;


-- 7. What is the average dish price within each category?         #the average price in American=10.066667, Asian=13.475000, Mexican=11.800000, Italian=16.750000

SELECT category, AVG(price) AS average_price
FROM menu_items
GROUP BY category;

