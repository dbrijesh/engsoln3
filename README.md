# Hello User Demo Application

A simple full-stack application demonstrating a "Hello User" interface with user details fetched from a backend API.

## 🚀 Tech Stack

### Backend
- **Java 17** (Spring Boot 3.2.2)
- **Spring Data JPA** with PostgreSQL
- **Lombok** for reducing boilerplate code
- **Package**: `com.hexademo.backend`

### Frontend
- **React 19** with Vite
- **Modern CSS** with gradients and animations
- **Responsive Design**

## 📁 Project Structure

```
DemoAKS/
├── backend/
│   ├── src/main/java/com/hexademo/backend/
│   │   ├── BackendApplication.java
│   │   ├── config/
│   │   │   ├── DataLoader.java
│   │   │   └── WebConfig.java
│   │   ├── controllers/
│   │   │   └── UserController.java
│   │   ├── dtos/
│   │   │   └── UserDto.java
│   │   ├── entities/
│   │   │   └── User.java
│   │   ├── repositories/
│   │   │   └── UserRepository.java
│   │   └── services/
│   │       └── UserService.java
│   └── pom.xml
└── frontend/
    ├── src/
    │   ├── App.jsx
    │   ├── App.css
    │   ├── index.css
    │   └── main.jsx
    └── package.json
```

## 🔧 Setup & Installation

### Prerequisites
- Java 17 or higher
- Node.js 16+ and npm
- PostgreSQL database

### Backend Setup

1. **Configure Database**
   
   Set the following environment variables:
   ```bash
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=hexademo
   DB_USER=your_db_user
   DB_PASSWORD=your_db_password
   FRONTEND_ORIGIN=http://localhost:5173
   ```

2. **Build and Run**
   ```bash
   cd backend
   ./mvnw clean install
   ./mvnw spring-boot:run
   ```

   The backend will start on `http://localhost:8080`

### Frontend Setup

1. **Install Dependencies**
   ```bash
   cd frontend
   npm install
   ```

2. **Configure API URL**
   
   The `.env` file is already configured with:
   ```
   VITE_API_URL=http://localhost:8080
   ```

3. **Run Development Server**
   ```bash
   npm run dev
   ```

   The frontend will start on `http://localhost:5173`

## 📡 API Endpoints

### Users API

- **GET** `/api/users` - Get all users
- **GET** `/api/users/{id}` - Get user by ID
- **POST** `/api/users` - Create a new user

### Example Request

```bash
# Get all users
curl http://localhost:8080/api/users

# Create a new user
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@hexademo.com",
    "role": "Developer"
  }'
```

## ✨ Features

- **Modern UI**: Beautiful gradient-based dark theme with smooth animations
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Loading States**: Elegant loading spinner while fetching data
- **Error Handling**: User-friendly error messages
- **Sample Data**: Automatically loads 4 sample users on first run
- **RESTful API**: Clean and simple REST endpoints
- **CORS Enabled**: Frontend and backend can communicate across origins

## 🎨 Design Highlights

- **Gradient Backgrounds**: Purple-blue gradient theme
- **Card Animations**: Hover effects with smooth transitions
- **Avatar Initials**: Auto-generated user avatars with initials
- **Icon Integration**: SVG icons for email, role, and ID
- **Glassmorphism**: Modern glass-like card effects
- **Micro-animations**: Pulse effects and fade-in animations

## 🔄 Changes from Original

1. **Package Name**: Changed from `com.sergio.crud` to `com.hexademo`
2. **JDK Version**: Downgraded from Java 21 to Java 17
3. **Application Type**: Changed from gym records CRUD to simple user directory
4. **Frontend**: Completely redesigned with modern aesthetics
5. **Data Model**: Simplified to User entity with name, email, and role

## 🐳 Docker Support

The application includes Dockerfiles for both frontend and backend. Refer to the `helm` and `k8s-manifest` directories for Kubernetes deployment configurations.

## 📝 License

This is a demo application for learning and demonstration purposes.

## 👥 Sample Users

The application comes pre-loaded with 4 sample users:
- Alice Johnson - Software Engineer
- Bob Smith - Product Manager
- Carol Williams - UX Designer
- David Brown - DevOps Engineer

---

**Built with ❤️ using Spring Boot and React**
