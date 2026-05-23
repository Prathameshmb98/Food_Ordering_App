# Food Ordering App - Java Backend

## Setup Instructions

### Prerequisites
- Java 17+
- Maven 3.8+
- Oracle Database 19c or higher

### Installation

```bash
cd backend
mvn clean install
```

### Configuration

1. Update `application.properties` with your database credentials:
```properties
spring.datasource.url=jdbc:oracle:thin:@<host>:<port>:orcl
spring.datasource.username=<username>
spring.datasource.password=<password>
```

### Running the Application

```bash
mvn spring-boot:run
```

API will be available at `http://localhost:8080`

### Project Structure

```
src/main/java/com/foodapp/
├── controller/        # REST API Controllers
├── service/          # Business Logic
├── repository/       # Data Access Layer
├── model/            # Entity Classes
├── dto/              # Data Transfer Objects
├── exception/        # Custom Exceptions
├── security/         # JWT & Security Config
├── config/           # Application Config
└── FoodOrderingAppApplication.java
```

### Key APIs
- **Authentication**: POST /api/auth/login, POST /api/auth/register
- **Restaurants**: GET /api/restaurants, GET /api/restaurants/{id}
- **Menu**: GET /api/restaurants/{id}/menu
- **Orders**: POST /api/orders, GET /api/orders/{id}
- **Payments**: POST /api/payments
- **Reviews**: POST /api/reviews

### Testing

```bash
mvn test
```
