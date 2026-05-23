-- Create Indexes for better query performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_restaurants_owner ON restaurants(owner_id);
CREATE INDEX idx_menu_items_restaurant ON menu_items(restaurant_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_restaurant ON orders(restaurant_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_payments_order ON payments(order_id);
CREATE INDEX idx_reviews_restaurant ON reviews(restaurant_id);
CREATE INDEX idx_reviews_customer ON reviews(customer_id);
CREATE INDEX idx_addresses_user ON addresses(user_id);
CREATE INDEX idx_favorites_customer ON favorites(customer_id);
