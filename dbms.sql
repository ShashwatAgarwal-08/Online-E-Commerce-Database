create database shoppingkart;
use shoppingkart;
show tables;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_id INT,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    transaction_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE usercart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);
CREATE TABLE product_categories (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT NOT NULL,
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(100) NOT NULL,
    card_number VARCHAR(16),
    expiry_date DATE,
    cvv VARCHAR(4),
    is_default BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE purchase_record (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_id INT,
    transaction_id INT,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);
CREATE TABLE delivery_updates (
    update_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    update_text TEXT,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE location_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    tracking_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO categories (category_name, description) VALUES
    ('Electronics', 'Products related to electronic devices and gadgets'),
    ('Clothing', 'Apparel and fashion accessories'),
    ('Books', 'Books of various genres');
INSERT INTO products (product_name, price, description) VALUES
    ('Smartphone', 599.99, 'Latest smartphone with advanced features'),
    ('T-shirt', 19.99, 'Casual cotton T-shirt in various colors'),
    ('Programming Book', 29.99, 'A beginner-friendly guide to programming'); 
SELECT * FROM categories;
INSERT INTO users (username, email, password) VALUES
    ('john_doe', 'john@example.com', 'password123'),
    ('jane_smith', 'jane@example.com', 'password456'),
    ('alice_green', 'alice@example.com', 'password789'),
    ('bob_jackson', 'bob@example.com', 'passwordabc');   
INSERT INTO addresses (user_id, address_line1, city, state, postal_code, country, is_default) VALUES
    (1, '123 Main St', 'New York', 'NY', '10001', 'USA', true),
    (2, '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', true),
    (3, '789 Oak St', 'Chicago', 'IL', '60601', 'USA', true),
    (4, '101 Pine St', 'Houston', 'TX', '77001', 'USA', true); 
INSERT INTO orders (user_id, total_amount) VALUES
    (1, 599.99), -- Order for user John Doe
    (2, 49.98),  -- Order for user Jane Smith
    (3, 199.99), -- Order for user Alice Green
    (4, 299.99); -- Order for user Bob Jackson    
INSERT INTO reviews (user_id, product_id, rating, review_text) VALUES
    (1, 1, 5, 'Great smartphone, highly recommend it!'),
    (2, 3, 4, 'The book was informative, but could use more examples.'),
    (3, 2, 5, 'The T-shirt fits perfectly and the color is vibrant.'),
    (4, 1, 4, 'Good quality smartphone, fast delivery.');   
    SELECT * FROM reviews;
INSERT INTO users (username, email, password) VALUES
    ('emma_jones', 'emma@example.com', 'password123'),
    ('michael_smith', 'michael@example.com', 'password456'),
    ('sophia_brown', 'sophia@example.com', 'password789'),
    ('william_davis', 'william@example.com', 'passwordabc'),
    ('olivia_taylor', 'olivia@example.com', 'passworddef'),
    ('james_miller', 'james@example.com', 'passwordghi'),
    ('charlotte_anderson', 'charlotte@example.com', 'passwordjkl'),
    ('ethan_wilson', 'ethan@example.com', 'passwordmno'),
    ('ava_thompson', 'ava@example.com', 'passwordpqr'),
    ('alexander_white', 'alexander@example.com', 'passwordstu');
INSERT INTO reviews (user_id, product_id, rating, review_text) VALUES
    (1, 1, 4, 'Good smartphone, but the battery life could be better.'),
    (2, 3, 5, 'Excellent book! It covers all the essential topics.'),
    (3, 2, 3, 'The T-shirt quality is average, expected better.'),
    (4, 1, 5, 'I love this smartphone! It exceeded my expectations.'),
    (5, 3, 4, 'Very informative book, highly recommended.'),
    (6, 2, 5, 'The T-shirt fits perfectly and the fabric is soft.'),
    (7, 1, 4, 'Fast delivery and the smartphone works great.'),
    (8, 2, 3, 'The color of the T-shirt faded after the first wash.'),
    (9, 3, 5, 'An excellent book for beginners in programming.'),
    (10, 1, 4, 'Satisfied with the purchase, thank you!');
INSERT INTO categories (category_name, description) VALUES
    ('Home & Kitchen', 'Products related to home and kitchen appliances'),
    ('Beauty & Personal Care', 'Cosmetics and personal care products'),
    ('Toys & Games', 'Toys and games for children'),
    ('Sports & Outdoors', 'Sports equipment and outdoor gear'),
    ('Health & Wellness', 'Products related to health and wellness'),
    ('Automotive', 'Automobile accessories and parts'),
    ('Pet Supplies', 'Supplies for pets and pet care');
INSERT INTO orders (user_id, total_amount) VALUES
    (5, 599.99),  -- User ID 5 (Emma Jones) - Order total $599.99
    (6, 99.99),   -- User ID 6 (Michael Smith) - Order total $99.99
    (7, 499.99),  -- User ID 7 (Sophia Brown) - Order total $499.99
    (8, 199.99),  -- User ID 8 (William Davis) - Order total $199.99
    (9, 349.99),  -- User ID 9 (Olivia Taylor) - Order total $349.99
    (10, 279.99); -- User ID 10 (James Miller) - Order total $279.99
INSERT INTO products (product_name, price, description) VALUES
    ('Jeans', 39.99, 'Classic denim jeans available in various sizes'),
    ('Wireless Headphones', 79.99, 'Bluetooth headphones with noise-cancellation technology'),
    ('Yoga Mat', 29.99, 'High-quality yoga mat for home workouts'),
    ('Digital Camera', 449.99, 'Professional-grade digital camera with 4K recording'),
    ('Running Shoes', 89.99, 'Lightweight running shoes for enhanced performance'),
    ('Coffee Maker', 79.99, 'Programmable coffee maker with auto-shutoff feature'),
    ('Backpack', 49.99, 'Durable backpack with multiple compartments for storage'),
    ('Wireless Mouse', 19.99, 'Ergonomic wireless mouse for comfortable usage'),
    ('Cookware Set', 129.99, 'Non-stick cookware set for versatile cooking options');
INSERT INTO delivery_updates (order_id, update_text) VALUES
    (1, 'Order placed, awaiting processing'),
    (2, 'Order processed and ready for shipment'),
    (3, 'Order shipped, estimated delivery in 3-5 business days'),
    (4, 'Order out for delivery'),
    (5, 'Delivery attempted, recipient not available'),
    (6, 'Delivery successful, package received by recipient'),
    (7, 'Order delayed due to weather conditions'),
    (8, 'Order delivered to local distribution center'),
    (9, 'Order returned by customer, reason: wrong item received'),
    (10, 'Order returned by customer, reason: damaged during shipment');
INSERT INTO location_tracking (order_id, latitude, longitude) VALUES
    (1, 40.7128, -74.0060),   -- New York City coordinates
    (2, 34.0522, -118.2437),  -- Los Angeles coordinates
    (3, 41.8781, -87.6298),   -- Chicago coordinates
    (4, 29.7604, -95.3698),   -- Houston coordinates
    (5, 37.7749, -122.4194),  -- San Francisco coordinates
    (6, 39.9526, -75.1652),   -- Philadelphia coordinates
    (7, 33.7490, -84.3880),   -- Atlanta coordinates
    (8, 32.7767, -96.7970),   -- Dallas coordinates
    (9, 35.2271, -80.8431),   -- Charlotte coordinates
    (10, 30.2672, -97.7431);  -- Austin coordinates
INSERT INTO payments (user_id, payment_method, card_number, expiry_date, cvv) VALUES
    (1, 'Credit Card', '1234', '2026-12-31', '123'),
    (2, 'PayPal', '3456', NULL, NULL),
    (3, 'Credit Card', '9876', '2025-11-30', '456'),
    (4, 'Credit Card', '4567', '2025-06-30', '789'),
    (5, 'Credit Card', '3210', '2026-09-30', '987'),
    (6, 'PayPal', '6784', NULL, NULL),
    (7, 'Credit Card', '6543', '2025-03-31', '654'),
    (8, 'Credit Card', '8901', '2026-07-31', '321'),
    (9, 'Credit Card', '5432', '2025-04-30', '890'),
    (10, 'Credit Card', '2109', '2026-02-28', '234');
INSERT INTO product_categories (product_id, category_id) VALUES
    (1, 1),   -- Smartphone belongs to Electronics category
    (2, 2),   -- T-shirt belongs to Clothing category
    (3, 3),   -- Programming Book belongs to Books category
    (4, 4),   -- Smartwatch belongs to Electronics category
    (5, 5),   -- Jeans belongs to Clothing category
    (6, 6),   -- Wireless Headphones belongs to Electronics category
    (7, 7),   -- Yoga Mat belongs to Sports & Outdoors category
    (8, 8),   -- Digital Camera belongs to Electronics category
    (9, 9),   -- Coffee Maker belongs to Home & Kitchen category
    (10, 10); -- Backpack belongs to Travel & Luggage category
INSERT INTO transactions (user_id, amount, transaction_date) VALUES
    (1, 99.99, '2024-03-23 08:30:00'),
    (2, 149.99, '2024-03-23 09:45:00'),
    (3, 199.99, '2024-03-23 10:15:00'),
    (4, 299.99, '2024-03-23 11:30:00'),
    (5, 49.99, '2024-03-23 12:45:00'),
    (6, 79.99, '2024-03-23 13:15:00'),
    (7, 399.99, '2024-03-23 14:30:00'),
    (8, 29.99, '2024-03-23 15:45:00'),
    (9, 499.99, '2024-03-23 16:15:00'),
    (10, 149.99, '2024-03-23 17:30:00');
INSERT INTO usercart (user_id, product_id, quantity) VALUES
    (1, 1, 2),   -- John Doe (user_id 1) added 2 smartphones (product_id 1) to the cart
    (2, 3, 1),   -- Jane Smith (user_id 2) added 1 book (product_id 3) to the cart
    (3, 2, 3),   -- Alice Green (user_id 3) added 3 t-shirts (product_id 2) to the cart
    (4, 4, 1),   -- Bob Jackson (user_id 4) added 1 smartwatch (product_id 4) to the cart
    (5, 5, 2),   -- Emma Jones (user_id 5) added 2 jeans (product_id 5) to the cart
    (6, 6, 1),   -- Michael Smith (user_id 6) added 1 wireless headphones (product_id 6) to the cart
    (7, 7, 1),   -- Sophia Brown (user_id 7) added 1 yoga mat (product_id 7) to the cart
    (8, 8, 2),   -- William Davis (user_id 8) added 2 digital cameras (product_id 8) to the cart
    (9, 9, 1),   -- Olivia Taylor (user_id 9) added 1 coffee maker (product_id 9) to the cart
    (10, 10, 3); -- James Miller (user_id 10) added 3 backpacks (product_id 10) to the cart
INSERT INTO addresses (user_id, address_line1, city, state, postal_code, country, is_default) VALUES
    (5, '543 Cedar St', 'Miami', 'FL', '33101', 'USA', true),
    (6, '876 Maple St', 'San Francisco', 'CA', '94101', 'USA', true),
    (7, '210 Birch St', 'Seattle', 'WA', '98101', 'USA', true),
    (8, '975 Oak St', 'Boston', 'MA', '02101', 'USA', true),
    (9, '384 Elm St', 'Philadelphia', 'PA', '19101', 'USA', true),
    (10, '753 Pine St', 'Denver', 'CO', '80201', 'USA', true);
    
    
-- Constraints:
-- Add a NOT NULL constraint to the username, email, and password columns to prevent them from being null:
ALTER TABLE users
MODIFY COLUMN username VARCHAR(50) NOT NULL,
MODIFY COLUMN email VARCHAR(100) NOT NULL,
MODIFY COLUMN password VARCHAR(100) NOT NULL;
-- Add a foreign key constraint to the category_id column referencing the categories table:
ALTER TABLE product
ADD fk_category_id INT;

ALTER TABLE products
ADD CONSTRAINT fk_category_id 
FOREIGN KEY (fk_category_id) REFERENCES categories(category_id);

-- Queries:
-- Retrieve products with a specific price range:
SELECT * FROM products WHERE price < 50;
-- Update the email of a user:
UPDATE users SET email = 'new_email@example.com' WHERE user_id = 1;

-- Sub-queries:
-- Retrieve products with a price higher than the average price:
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);
-- Retrieve users who have placed orders:
SELECT * FROM users WHERE user_id IN (SELECT DISTINCT user_id FROM orders);

-- Joins:
-- Retrieve products along with their corresponding reviews:
SELECT p.*, r.rating, r.review_text
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id;
-- Retrieve orders along with user details using INNER JOIN:
SELECT o.order_id, o.order_date, u.username, u.email
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;
-- Retrieve all users along with their associated orders using RIGHT JOIN:
SELECT o.order_id, o.order_date, u.username, u.email
FROM orders o
RIGHT JOIN users u ON o.user_id = u.user_id;
-- Retrieve users along with their associated orders:
SELECT u.*, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

-- Views:
--  view to display top-rated products:
CREATE VIEW top_rated_products AS
SELECT p.*
FROM products p
INNER JOIN reviews r ON p.product_id = r.product_id
WHERE r.rating >= 4;
SELECT * FROM top_rated_products;
DROP VIEW IF EXISTS top_rated_products ;

-- Triggers:
-- trigger to update product stock after an order is placed:
CREATE TRIGGER update_stock_trigger
AFTER INSERT ON order_items
FOR EACH ROW
UPDATE products
SET stock_quantity = stock_quantity - NEW.quantity
WHERE product_id = NEW.product_id;
DROP TRIGGER IF EXISTS update_stock_trigger;
SHOW triggers;


--Trigger:
DELIMITER //

CREATE TRIGGER update_total_amount_trigger
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    DECLARE order_total DECIMAL(10, 2);

    -- Calculate the total amount for the order
    SELECT SUM(oi.quantity * p.price)
    INTO order_total
    FROM order_items oi
    INNER JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = NEW.order_id;

    -- Update the total_amount in the orders table
    UPDATE orders
    SET total_amount = order_total
    WHERE order_id = NEW.order_id;
END //

DELIMITER ;


-- Cursors:
-- cursor to calculate the total amount spent by each user:
DELIMITER //
CREATE PROCEDURE calculate_total_spent()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE total_spent DECIMAL(10, 2);

    -- Declare a cursor to select distinct user_ids from the orders table
    DECLARE cur CURSOR FOR SELECT DISTINCT user_id FROM orders;
    -- Declare a handler for when there are no more rows to fetch
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur; -- Open the cursor

    read_loop: LOOP
        FETCH cur INTO user_id; -- Fetch the next user_id from the cursor
        IF done THEN
            LEAVE read_loop; -- If there are no more rows, exit the loop
        END IF;

        -- Calculate total amount spent by the user
        SELECT SUM(oi.quantity * p.price) INTO total_spent
        FROM order_items oi
        INNER JOIN products p ON oi.product_id = p.product_id
        WHERE oi.order_id IN (SELECT order_id FROM orders WHERE user_id = user_id);

        -- Output or use the total amount spent
        SELECT CONCAT('User ID: ', user_id, ', Total Spent: ', total_spent) AS result;

    END LOOP;

    CLOSE cur; -- Close the cursor
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS calculate_total_spent;




-- Insert some orders
INSERT INTO orders (user_id, total_amount) VALUES
    (1, 0), -- User ID 1 (John Doe)
    (2, 0), -- User ID 2 (Jane Smith)
    (3, 0); -- User ID 3 (Alice Green)

-- Insert order items for the first order (order_id = 1)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (1, 1, 2, 599.99), -- 2 smartphones
    (1, 2, 1, 19.99);   -- 1 T-shirt

-- Insert order items for the second order (order_id = 2)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (2, 3, 1, 29.99),   -- 1 Programming Book
    (2, 2, 3, 19.99);   -- 3 T-shirts

-- Insert order items for the third order (order_id = 3)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (3, 1, 1, 599.99),  -- 1 smartphone
    (3, 3, 2, 29.99);   -- 2 Programming Books



DELIMITER //

CREATE TRIGGER update_total_amount_trigger
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    DECLARE order_total DECIMAL(10, 2);

    -- Calculate the total amount for the order
    SELECT SUM(oi.quantity * p.price)
    INTO order_total
    FROM order_items oi
    INNER JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = NEW.order_id;

    -- Update the total_amount in the orders table
    UPDATE orders
    SET total_amount = order_total
    WHERE order_id = NEW.order_id;
END //

DELIMITER ;
