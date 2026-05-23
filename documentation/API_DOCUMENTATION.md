# Food Ordering App - API Documentation

## Base URL
```
http://localhost:8080/api
```

## Authentication Endpoints

### Register User
```
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "firstName": "John",
  "lastName": "Doe",
  "phone": "+1234567890",
  "userType": "CUSTOMER"
}

Response: 200 OK
{
  "id": 1,
  "email": "user@example.com",
  "token": "jwt_token_here"
}
```

### Login
```
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}

Response: 200 OK
{
  "token": "jwt_token_here",
  "userId": 1,
  "userType": "CUSTOMER"
}
```

## Restaurant Endpoints

### Get All Restaurants
```
GET /restaurants

Response: 200 OK
[
  {
    "restaurantId": 1,
    "name": "Pizza Palace",
    "rating": 4.5,
    "cuisineType": "Italian",
    "phone": "+1234567890",
    "address": "123 Main St"
  }
]
```

### Get Restaurant by ID
```
GET /restaurants/{restaurantId}

Response: 200 OK
{
  "restaurantId": 1,
  "name": "Pizza Palace",
  "description": "Best pizza in town",
  "rating": 4.5,
  "cuisineType": "Italian",
  "phone": "+1234567890",
  "email": "info@pizzapalace.com",
  "address": "123 Main St"
}
```

## Menu Endpoints

### Get Restaurant Menu
```
GET /restaurants/{restaurantId}/menu

Response: 200 OK
[
  {
    "itemId": 1,
    "name": "Margherita Pizza",
    "description": "Fresh mozzarella and basil",
    "price": 12.99,
    "category": "Pizza",
    "isVegetarian": true,
    "imageUrl": "https://..."
  }
]
```

## Order Endpoints

### Create Order
```
POST /orders
Authorization: Bearer {token}
Content-Type: application/json

{
  "restaurantId": 1,
  "items": [
    {
      "itemId": 1,
      "quantity": 2,
      "specialInstructions": "Extra cheese"
    }
  ],
  "deliveryAddressId": 1,
  "totalAmount": 25.98
}

Response: 201 Created
{
  "orderId": 1,
  "status": "PENDING",
  "totalAmount": 25.98,
  "orderDate": "2024-01-15T10:30:00Z"
}
```

### Get Order by ID
```
GET /orders/{orderId}
Authorization: Bearer {token}

Response: 200 OK
{
  "orderId": 1,
  "customerId": 1,
  "restaurantId": 1,
  "status": "CONFIRMED",
  "totalAmount": 25.98,
  "orderDate": "2024-01-15T10:30:00Z",
  "items": [...]
}
```

## Payment Endpoints

### Process Payment
```
POST /payments
Authorization: Bearer {token}
Content-Type: application/json

{
  "orderId": 1,
  "amount": 25.98,
  "paymentMethod": "CREDIT_CARD",
  "cardToken": "tok_visa"
}

Response: 200 OK
{
  "paymentId": 1,
  "status": "SUCCESS",
  "transactionId": "txn_123456"
}
```

## Review Endpoints

### Add Review
```
POST /reviews
Authorization: Bearer {token}
Content-Type: application/json

{
  "orderId": 1,
  "restaurantId": 1,
  "rating": 5,
  "comment": "Excellent service and delicious food!"
}

Response: 201 Created
{
  "reviewId": 1,
  "rating": 5,
  "comment": "Excellent service and delicious food!",
  "createdDate": "2024-01-15T15:30:00Z"
}
```
