# AWS Deployment Guide

## Architecture
- **Frontend**: S3 + CloudFront CDN
- **Backend**: Elastic Beanstalk or EC2
- **Database**: RDS Oracle
- **Storage**: S3 for images
- **DNS**: Route 53
- **SSL**: AWS Certificate Manager

## Deployment Steps

### 1. Frontend Deployment (Angular)

```bash
# Build for production
cd frontend
ng build --configuration production

# Deploy to S3
aws s3 sync dist/food-ordering-app s3://your-bucket-name

# Invalidate CloudFront
aws cloudfront create-invalidation --distribution-id YOUR_DIST_ID --paths "/*"
```

### 2. Backend Deployment (Java)

```bash
# Build JAR
cd backend
mvn clean package

# Deploy to Elastic Beanstalk
eb init -p java-17
eb create food-ordering-app-env
eb deploy
```

### 3. Database Setup

- Create RDS Oracle instance
- Run SQL scripts from database folder
- Update connection string in application.properties

## Environment Files

See `env-example.yml` for required environment variables.

## Monitoring
- CloudWatch for logs and metrics
- SNS for alerts
- XRay for tracing
