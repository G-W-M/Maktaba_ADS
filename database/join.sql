SELECT o.order_id,
    u.full_name,
    b.title,
    oi.quantity
FROM orders o
    INNER JOIN users u ON o.user_id = u.user_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN books b ON oi.book_id = b.book_id;
--RIGHT JOIN
SELECT r.review_id,
    b.title,
    r.rating
FROM books b
    RIGHT JOIN reviews r ON b.book_id = r.book_id;
--LEFT JOIN
SELECT r.review_id,
    b.title,
    r.rating
FROM books b
    LEFT JOIN reviews r ON b.book_id = r.book_id;