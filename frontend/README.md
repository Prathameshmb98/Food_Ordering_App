# Food Ordering App - Angular Frontend

## Setup Instructions

### Prerequisites
- Node.js v18+
- npm v9+
- Angular CLI v16+

### Installation

```bash
cd frontend
npm install -g @angular/cli
npm install
```

### Development Server

```bash
ng serve
```

Navigate to `http://localhost:4200/`

### Project Structure

```
src/
├── app/
│   ├── auth/              # Authentication module
│   ├── customer/          # Customer features
│   ├── restaurant/        # Restaurant management
│   ├── admin/             # Admin dashboard
│   ├── shared/            # Shared services & components
│   ├── models/            # TypeScript interfaces
│   └── services/          # API services
├── assets/                # Images, icons
├── styles/                # Global styles
└── environments/          # Environment configs
```

### Key Features
1. **Authentication**: Login/Signup for customers and restaurants
2. **Browse Restaurants**: View restaurants, menus, and ratings
3. **Place Orders**: Add items to cart and checkout
4. **Track Orders**: Real-time order status tracking
5. **Payment**: Multiple payment gateway integration
6. **Reviews & Ratings**: Leave feedback on restaurants and food
7. **User Profile**: Manage addresses, payment methods
8. **Search & Filter**: Find restaurants and food items
