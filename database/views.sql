-- ADMIN VIEWS
CREATE OR REPLACE VIEW admin_order_summary AS
SELECT o.order_id,
    u.full_name,
    o.total_amount,
    o.order_status,
    p.payment_status
FROM orders o
    JOIN users u ON o.user_id = u.user_id
    LEFT JOIN payments p ON o.order_id = p.order_id;
-- CUSTOMER VIEWS
CREATE OR REPLACE VIEW customer_book_list AS
SELECT book_id,
    title,
    author,
    price,
    stock_quantity
FROM books
WHERE is_available = 1;