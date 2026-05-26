
create database bigdata;

USE bigdata;

CREATE TABLE dataset (
    transaction_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    product_price FLOAT,
    quantity INT,
    payment_method VARCHAR(50),
    city VARCHAR(100),
    order_date DATE,
    delivery_days INT,
    rating FLOAT,
    returned VARCHAR(10)
);

LOAD DATA LOCAL INFILE 'C:/Users/nblsh/bigdata_dummy_dataset.csv'
INTO TABLE dataset
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM dataset LIMIT 10;

#Analytics Query

#Total_Query
SELECT SUM(product_price * quantity) AS total_revenue
FROM dataset;

#Category_Revenue
SELECT category,
       SUM(product_price * quantity) AS revenue
FROM dataset
GROUP BY category
ORDER BY revenue DESC;

#City-Wise_Sales
SELECT city,
       COUNT(*) AS orders
FROM dataset
GROUP BY city;
