# Food Ordering App - Mobile Applications

## iOS Development

### Prerequisites
- Xcode 14+
- iOS 14+
- CocoaPods or Swift Package Manager

### Setup
```bash
cd mobile/iOS
pod install
open FoodOrderingApp.xcworkspace
```

### Architecture
- MVVM with Reactive Programming
- Alamofire for networking
- Core Data for local storage
- MapKit for delivery tracking

## Android Development

### Prerequisites
- Android Studio Flamingo+
- Android SDK 28+
- Java 17+

### Setup
```bash
cd mobile/Android
# Open in Android Studio
# Sync Gradle files
```

### Architecture
- MVVM with LiveData
- Retrofit for networking
- Room Database for local storage
- Google Maps API for delivery tracking

## Common Features
1. User Authentication
2. Browse Restaurants & Menus
3. Place Orders
4. Real-time Order Tracking
5. Payment Integration
6. Push Notifications
7. Ratings & Reviews
8. User Profile Management

## API Integration
Both apps connect to the Java backend API at:
- Development: http://localhost:8080/api
- Production: https://api.foodapp.aws.com/api
