# Analyze Restaurant Order Data Using SQL

## Overview

This project provides an in-depth analysis of restaurant order data to uncover key insights into customer behavior, popular menu items, and spending patterns. The analysis is based on two primary datasets:

Menu Items Table: Contains details about the restaurant’s diverse offerings.

Order Details Table: Tracks customer purchases over time.

By leveraging SQL, we extract valuable business intelligence to guide data-driven decisions and optimize menu offerings.

## Objectives

- Explore the Menu: Identify the number of menu items, price range, and distribution across categories.

- Analyze Orders: Examine trends in order volume, date range, and largest orders.

- Understand Customer Behavior: Identify popular and underperforming items, as well as high-spending customers.


## Tools & Technologies

- SQL

- MySQL


## Key Insights

- The restaurant offers 32 menu items across multiple cuisines.

- Most Expensive Item: Shrimp Scampi 

- Least Expensive Item: Edamame 

- Top-Selling Category: Italian dishes dominate high-spending orders.

- Total Orders: 5,370 orders recorded within the dataset. 

- Total Items Ordered: 12,234 items purchased.

- Highest-Spending Orders: Customers who spent the most favored Italian cuisine.

- Largest Orders: Some orders contained 12+ items, with 20 such instances in the dataset.

```
-- View the menu items table
SELECT * FROM menu_items;

-- Count total items on the menu
SELECT COUNT(*) FROM menu_items;

-- Identify the least and most expensive items
SELECT item_name, price FROM menu_items ORDER BY price DESC LIMIT 1;  -- Most expensive
SELECT item_name, price FROM menu_items ORDER BY price ASC LIMIT 1;   -- Least expensive

-- Count the number of dishes in each category
SELECT category, COUNT(item_name) AS item_count FROM menu_items GROUP BY category;
```
```-- View order details
SELECT * FROM order_details;

-- Identify the date range of orders
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- Count total number of orders
SELECT COUNT(DISTINCT order_id) FROM order_details;

-- Count total items ordered
SELECT COUNT(*) FROM order_details;

-- Identify the order with the most items
SELECT order_id, COUNT(item_id) AS num_items FROM order_details GROUP BY order_id ORDER BY num_items DESC LIMIT 1;
```

```
-- Join menu items with order details
SELECT * FROM order_details od LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id;

-- Identify the most and least ordered items
SELECT item_name, COUNT(order_details_id) AS num_of_purchases FROM order_details od LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id GROUP BY item_name ORDER BY num_of_purchases DESC LIMIT 5; -- Most ordered
SELECT item_name, COUNT(order_details_id) AS num_of_purchases FROM order_details od LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id GROUP BY item_name ORDER BY num_of_purchases ASC LIMIT 5; -- Least ordered

-- Identify top 5 highest-spending orders
SELECT order_id, SUM(price) AS total_spent FROM order_details od LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id GROUP BY order_id ORDER BY total_spent DESC LIMIT 5;
```

## Business Recommendations

- Enhance High-Performing Categories: Focus on Italian cuisine as it generates the highest revenue.

- Promote Lesser-Ordered Items: Adjust pricing or create promotional offers for underperforming dishes.

- Target High-Spending Customers: Introduce a loyalty program to encourage repeat visits and higher spending.

- Expand Online Presence: Implement an online ordering system to increase accessibility and sales.

## Conclusion

This SQL-based analysis provides actionable insights to optimize restaurant operations and drive business growth. By understanding menu performance and customer preferences, the restaurant can make informed decisions to enhance profitability and customer satisfaction.


