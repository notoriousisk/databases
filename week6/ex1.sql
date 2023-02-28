
-- exercise 1 a --

CREATE TABLE IF NOT EXISTS customer (
	customerId INT PRIMARY KEY,
	customerName VARCHAR(15),
	city VARCHAR(15)
);

INSERT INTO customer (customerId, customerName, city)
SELECT DISTINCT customerId, customerName, city
FROM orders;

CREATE TABLE IF NOT EXISTS item (
	itemId INT PRIMARY KEY,
	itemName VARCHAR(15),
	price REAL
);

INSERT INTO item (itemId, itemName, price)
SELECT DISTINCT itemId, itemName, price
FROM orders;

CREATE TABLE IF NOT EXISTS transaction (
	orderId INT PRIMARY KEY,
	date DATE,
	customerId INT REFERENCES customer(customerId)
);

INSERT INTO transaction (orderId, date, customerId)
SELECT DISTINCT orderId, date, customerId
FROM orders;

CREATE TABLE IF NOT EXISTS ordering (
	orderId INT REFERENCES transaction(orderId),
	itemId INT REFERENCES item(itemId),
	quantity INT,
	PRIMARY KEY (orderId, itemId)
);

INSERT INTO ordering (orderId, itemId, quantity)
SELECT DISTINCT orderId, itemId, quantity
FROM orders;

DROP TABLE orders;

-- exercise 1 b (1) --
SELECT 
	ordering.orderId, 
	SUM(ordering.quantity) AS total_number, 
	SUM(ordering.quantity * price) AS total_payment 
FROM ordering INNER JOIN item
ON ordering.itemId = item.itemId
GROUP BY ordering.orderId
ORDER BY ordering.orderId;

-- exercise 1 b (2) --
SELECT transaction.customerId, customer.customerName
FROM (
	SELECT 
		ordering.orderId, 
		SUM(ordering.quantity) AS total_number, 
		SUM(ordering.quantity * price) AS total_payment 
	FROM ordering INNER JOIN item
	ON ordering.itemId = item.itemId
	GROUP BY ordering.orderId
) AS foo INNER JOIN transaction 
ON foo.orderid = transaction.orderId
INNER JOIN customer 
ON transaction.customerId = customer.customerId
ORDER BY total_payment DESC
LIMIT 1;
