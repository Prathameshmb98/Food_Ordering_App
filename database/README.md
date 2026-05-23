# Database Schema - Oracle SQL

## Setup Instructions

### Prerequisites
- Oracle Database 19c or higher
- SQL*Plus or Oracle SQL Developer

### Create Database User

```sql
CREATE USER foodapp_user IDENTIFIED BY foodapp_password;
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE SYNONYM TO foodapp_user;
ALTER USER foodapp_user QUOTA UNLIMITED ON USERS;
```

### Run Schema Scripts

1. Connect as foodapp_user
2. Run the SQL scripts in order:
   - 001_create_tables.sql
   - 002_create_sequences.sql
   - 003_create_indexes.sql
   - 004_insert_sample_data.sql

## Database Tables

### Users
- Stores customer and admin information

### Restaurants
- Restaurant details, ratings, location

### Menu Items
- Food items, prices, descriptions

### Orders
- Order details, status, total amount

### Order Items
- Items in each order

### Payments
- Payment transactions

### Reviews
- User reviews and ratings

### Addresses
- User and restaurant addresses
