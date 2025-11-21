--GET CUSTOMER ORDERS PROCEDURE
DELIMITER $$ CREATE PROCEDURE GetCustomerOrders(IN uid INT) BEGIN
SELECT order_id,
    order_date,
    total_amount,
    order_status
FROM orders
WHERE user_id = uid;
END $$ DELIMITER;
--GET TOTAL SALES PROCEDURE
DELIMITER $$ CREATE PROCEDURE TotalSales() BEGIN
SELECT SUM(total_amount) AS total_sales
FROM orders
WHERE payment_status = 'Paid';
END $$ DELIMITER;
--GET INVENTORY SUMMARY PROCEDURE
DELIMITER $$ CREATE PROCEDURE InventorySummary() BEGIN
SELECT title,
    stock_quantity,
    reserved_stock
FROM books;
END $$ DELIMITER;