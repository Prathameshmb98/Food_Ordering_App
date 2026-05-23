# Food Ordering App - Setup Guide

## System Requirements
- Java 17+
- Node.js 18+
- npm 9+
- Oracle Database 19c+
- Git

## Frontend Setup (Angular)

### 1. Install Dependencies
```bash
cd frontend
npm install
```

### 2. Configure API URL
Update `src/environments/environment.ts`:
```typescript
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
```

### 3. Run Development Server
```bash
ng serve
```
Access at: http://localhost:4200

## Backend Setup (Java)

### 1. Install Dependencies
```bash
cd backend
mvn clean install
```

### 2. Configure Database
Update `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl
spring.datasource.username=foodapp_user
spring.datasource.password=foodapp_password
```

### 3. Run Application
```bash
mvn spring-boot:run
```
API available at: http://localhost:8080/api

## Database Setup (Oracle)

### 1. Create User
```sql
CREATE USER foodapp_user IDENTIFIED BY foodapp_password;
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE TO foodapp_user;
ALTER USER foodapp_user QUOTA UNLIMITED ON USERS;
```

### 2. Run SQL Scripts
```bash
sqlplus foodapp_user@orcl
@database/001_create_tables.sql
@database/002_create_sequences.sql
@database/003_create_indexes.sql
```

## Using Docker

### Start All Services
```bash
cd deployment
docker-compose up -d
```

### Access Services
- Frontend: http://localhost:4200
- Backend: http://localhost:8080/api
- Database: localhost:1521

## Verification

### 1. Check Backend
```bash
curl http://localhost:8080/api/restaurants
```

### 2. Check Frontend
Open http://localhost:4200 in browser

### 3. Check Database Connection
```bash
sqlplus foodapp_user@orcl
```

## Next Steps
1. Configure payment gateway (Stripe/Razorpay)
2. Set up email notifications
3. Configure AWS S3 for image storage
4. Deploy to AWS
