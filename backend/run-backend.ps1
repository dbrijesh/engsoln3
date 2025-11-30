# Backend Run Script for Windows PowerShell
# This script sets JAVA_HOME to JDK 17 and runs the Spring Boot application

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  HexaDemo Backend - Starting Server" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Set JAVA_HOME to JDK 17
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
Write-Host "JAVA_HOME set to: $env:JAVA_HOME" -ForegroundColor Green

# Set default environment variables if not present
if (-not $env:DB_HOST) { $env:DB_HOST = "localhost" }
if (-not $env:DB_PORT) { $env:DB_PORT = "5432" }
if (-not $env:DB_NAME) { $env:DB_NAME = "hexademo" }
if (-not $env:DB_USER) { $env:DB_USER = "postgres" }
if (-not $env:DB_PASSWORD) { $env:DB_PASSWORD = "password" }
if (-not $env:FRONTEND_ORIGIN) { $env:FRONTEND_ORIGIN = "http://localhost:5173" }

Write-Host "Using Database Config: $env:DB_HOST`:$env:DB_PORT/$env:DB_NAME" -ForegroundColor Gray

# Check if Postgres is reachable
Write-Host ""
Write-Host "Checking database connection..." -ForegroundColor Yellow
$connection = Test-NetConnection -ComputerName $env:DB_HOST -Port $env:DB_PORT -WarningAction SilentlyContinue

if ($connection.TcpTestSucceeded) {
    Write-Host "✓ Connected to PostgreSQL at $env:DB_HOST`:$env:DB_PORT" -ForegroundColor Green
    $springArgs = "spring-boot:run"
} else {
    Write-Host "⚠️  Could not connect to PostgreSQL at $env:DB_HOST`:$env:DB_PORT" -ForegroundColor Red
    Write-Host "✓ Switching to H2 In-Memory Database (Fallback)" -ForegroundColor Green
    $springArgs = "spring-boot:run -Dspring-boot.run.profiles=h2"
}

# Verify Java version
Write-Host ""
Write-Host "Checking Java version..." -ForegroundColor Yellow
& "$env:JAVA_HOME\bin\java.exe" -version

Write-Host ""
Write-Host "Starting Spring Boot application..." -ForegroundColor Yellow
Write-Host "Backend will be available at: http://localhost:8080" -ForegroundColor Green
Write-Host "API endpoint: http://localhost:8080/api/users" -ForegroundColor Green
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Run the Spring Boot application
Invoke-Expression ".\mvnw.cmd $springArgs"
