-- Users Table
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(20),
    user_type VARCHAR2(20) NOT NULL, -- CUSTOMER, RESTAURANT_ADMIN, ADMIN
    is_active NUMBER(1) DEFAULT 1,
    created_date TIMESTAMP DEFAULT SYSDATE,
    updated_date TIMESTAMP DEFAULT SYSDATE
);

-- Restaurants Table
CREATE TABLE restaurants (
    restaurant_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(500),
    owner_id NUMBER NOT NULL,
    address_id NUMBER NOT NULL,
    phone VARCHAR2(20),
    email VARCHAR2(100),
    rating NUMBER(3,2) DEFAULT 0,
    cuisine_type VARCHAR2(100),
    is_active NUMBER(1) DEFAULT 1,
    created_date TIMESTAMP DEFAULT SYSDATE,
    updated_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (owner_id) REFERENCES users(user_id)
);

-- Menu Items Table
CREATE TABLE menu_items (
    item_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(300),
    price NUMBER(8,2) NOT NULL,
    category VARCHAR2(50),
    is_vegetarian NUMBER(1) DEFAULT 0,
    is_available NUMBER(1) DEFAULT 1,
    image_url VARCHAR2(255),
    created_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Orders Table
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    total_amount NUMBER(10,2) NOT NULL,
    delivery_charge NUMBER(8,2) DEFAULT 0,
    tax_amount NUMBER(8,2) DEFAULT 0,
    status VARCHAR2(20) NOT NULL, -- PENDING, CONFIRMED, PREPARING, OUT_FOR_DELIVERY, DELIVERED, CANCELLED
    delivery_address_id NUMBER NOT NULL,
    order_date TIMESTAMP DEFAULT SYSDATE,
    delivery_date TIMESTAMP,
    created_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (customer_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    item_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    price NUMBER(8,2) NOT NULL,
    special_instructions VARCHAR2(300),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL UNIQUE,
    amount NUMBER(10,2) NOT NULL,
    payment_method VARCHAR2(50) NOT NULL, -- CREDIT_CARD, DEBIT_CARD, WALLET, UPI
    payment_status VARCHAR2(20) NOT NULL, -- PENDING, SUCCESS, FAILED
    transaction_id VARCHAR2(100),
    created_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Reviews Table
CREATE TABLE reviews (
    review_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    rating NUMBER(2,1) NOT NULL, -- 1-5 stars
    comment VARCHAR2(500),
    created_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (customer_id) REFERENCES users(user_id)
);

-- Addresses Table
CREATE TABLE addresses (
    address_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    street VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    state VARCHAR2(50) NOT NULL,
    postal_code VARCHAR2(20),
    latitude NUMBER(10,8),
    longitude NUMBER(11,8),
    is_default NUMBER(1) DEFAULT 0,
    created_date TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Favorites Table
CREATE TABLE favorites (
    favorite_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    created_date TIMESTAMP DEFAULT SYSDATE,
    UNIQUE(customer_id, restaurant_id),
    FOREIGN KEY (customer_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
