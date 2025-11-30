# Quick Start Guide - Hello User Demo

## Prerequisites
- Java 17 (JDK 17)
- Node.js 16+ and npm
- PostgreSQL database running

## 🚀 Quick Setup (5 minutes)

### Step 1: Database Setup

Create a PostgreSQL database:
```sql
CREATE DATABASE hexademo;
```

### Step 2: Set Environment Variables

**Windows (PowerShell):**
```powershell
$env:DB_HOST="localhost"
$env:DB_PORT="5432"
$env:DB_NAME="hexademo"
$env:DB_USER="your_username"
$env:DB_PASSWORD="your_password"
$env:FRONTEND_ORIGIN="http://localhost:5173"
```

**Linux/Mac (Bash):**
```bash
export DB_HOST=localhost
export DB_PORT=5432
export DB_NAME=hexademo
export DB_USER=your_username
export DB_PASSWORD=your_password
export FRONTEND_ORIGIN=http://localhost:5173
```

### Step 3: Quick Start with Helper Scripts (Recommended for Windows)

We've created PowerShell scripts to make starting the application easier:

**Option A: Start Everything at Once**
```powershell
.\start-all.ps1
```

> **Note:** If you get a "script cannot be loaded" error, run this command first to allow script execution:
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```

**Option B: Start Individually**

Backend:
```powershell
cd backend
.\run-backend.ps1
```

Frontend (in a new terminal):
```powershell
cd frontend
.\run-frontend.ps1
```

### Step 3 (Alternative): Manual Start

If you prefer to start manually or are not on Windows:

**Backend:**

```bash
cd backend
./mvnw spring-boot:run
```

**Windows users:** Use `mvnw.cmd` instead of `./mvnw`

Wait for the message: `✅ Sample users loaded successfully!`

### Step 4: Start Frontend

Open a new terminal:
```bash
cd frontend
npm install
npm run dev
```

### Step 5: Open Browser

Navigate to: **http://localhost:5173**

You should see 4 sample users displayed with beautiful cards! 🎉

---

## 🔍 Troubleshooting

### Backend won't start
- **Issue**: `JAVA_HOME not found`
  - **Solution**: Install Java 17 and set JAVA_HOME environment variable

- **Issue**: Database connection error
  - **Solution**: Verify PostgreSQL is running and credentials are correct

### Frontend shows error
- **Issue**: "Error fetching users"
  - **Solution**: Make sure backend is running on port 8080

- **Issue**: CORS error
  - **Solution**: Check that FRONTEND_ORIGIN environment variable is set

---

## 📱 Testing the API

### Get all users
```bash
curl http://localhost:8080/api/users
```

### Get specific user
```bash
curl http://localhost:8080/api/users/1
```

### Create new user
```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Doe",
    "email": "jane.doe@hexademo.com",
    "role": "Data Scientist"
  }'
```

---

## 🎨 What You'll See

The application displays:
- **Header**: "👋 Hello Users!" with gradient text
- **User Cards**: Each showing:
  - Avatar with user initials
  - User name with "Hello, [name]!" greeting
  - Email address
  - Role/position
  - User ID
- **Animations**: Smooth hover effects and transitions
- **Dark Theme**: Modern purple-blue gradient design

---

## 🛑 Stopping the Application

### Backend
Press `Ctrl+C` in the backend terminal

### Frontend
Press `Ctrl+C` in the frontend terminal

---

## 📦 Building for Production

### Backend
```bash
cd backend
./mvnw clean package
java -jar target/backend-0.0.2-SNAPSHOT.jar
```

### Frontend
```bash
cd frontend
npm run build
# The built files will be in the 'dist' folder
```

---

## 🐳 Docker Quick Start

### Build and Run Backend
```bash
cd backend
docker build -t hexademo-backend .
docker run -p 8080:8080 \
  -e DB_HOST=host.docker.internal \
  -e DB_PORT=5432 \
  -e DB_NAME=hexademo \
  -e DB_USER=your_username \
  -e DB_PASSWORD=your_password \
  -e FRONTEND_ORIGIN=http://localhost:5173 \
  hexademo-backend
```

### Build and Run Frontend
```bash
cd frontend
docker build -t hexademo-frontend .
docker run -p 80:80 hexademo-frontend
```

Access at: http://localhost

---

## 💡 Tips

1. **Sample Data**: The app automatically creates 4 sample users on first run
2. **Hot Reload**: Frontend updates automatically when you edit files
3. **Database**: Uses JPA with `ddl-auto: update` - schema updates automatically
4. **CORS**: Already configured for local development

---

**Enjoy your Hello User Demo! 🚀**

For detailed documentation, see [README.md](README.md)
