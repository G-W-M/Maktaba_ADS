-- AFTER INSERT trigger to create a notification when a new order is placed
DELIMITER $$ CREATE TRIGGER after_order_insert
AFTER
INSERT ON orders FOR EACH ROW BEGIN
INSERT INTO notifications (user_id, message, status, created_at)
VALUES (
        NEW.user_id,
        CONCAT(
            'Your order #',
            NEW.order_id,
            ' has been placed.'
        ),
        'unread',
        NOW()
    );
END $$ DELIMITER;
-- BEFORE UPDATE trigger
DELIMITER $$ CREATE TRIGGER before_book_update BEFORE
UPDATE ON books FOR EACH ROW BEGIN IF NEW.stock_quantity < 0 THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
END IF;
END $$ DELIMITER;
-- AFTER DELETE trigger
to log changes in order status DELIMITER $$ CREATE TRIGGER after_order_delete
AFTER DELETE ON orders FOR EACH ROW BEGIN
INSERT INTO audit_trail (user_id, action, module, description, timestamp)
VALUES (
        OLD.user_id,
        'DELETE',
        'Orders',
        CONCAT('Order #', OLD.order_id, ' deleted.'),
        NOW()
    );
END $$ DELIMITER;