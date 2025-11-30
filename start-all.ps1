# Master Start Script for Windows PowerShell
# This script starts both backend and frontend in separate windows

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  HexaDemo - Starting Full Stack App" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "This will open two new PowerShell windows:" -ForegroundColor Yellow
Write-Host "  1. Backend (Spring Boot) - Port 8080" -ForegroundColor White
Write-Host "  2. Frontend (React/Vite) - Port 5173" -ForegroundColor White
Write-Host ""

# Check if PostgreSQL environment variables are set
if (-Not $env:DB_HOST) {
    Write-Host "⚠️  WARNING: Database environment variables not set!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please set the following environment variables:" -ForegroundColor Yellow
    Write-Host '  $env:DB_HOST = "localhost"' -ForegroundColor White
    Write-Host '  $env:DB_PORT = "5432"' -ForegroundColor White
    Write-Host '  $env:DB_NAME = "hexademo"' -ForegroundColor White
    Write-Host '  $env:DB_USER = "your_username"' -ForegroundColor White
    Write-Host '  $env:DB_PASSWORD = "your_password"' -ForegroundColor White
    Write-Host '  $env:FRONTEND_ORIGIN = "http://localhost:5173"' -ForegroundColor White
    Write-Host ""
    
    $continue = Read-Host "Continue anyway? (y/n)"
    if ($continue -ne "y") {
        Write-Host "Exiting..." -ForegroundColor Yellow
        exit
    }
}

Write-Host ""
Write-Host "Starting backend..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-File", ".\backend\run-backend.ps1"

Write-Host "Waiting 5 seconds before starting frontend..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "Starting frontend..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-File", ".\frontend\run-frontend.ps1"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✓ Both servers starting!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Backend:  http://localhost:8080/api/users" -ForegroundColor Cyan
Write-Host "Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host ""
Write-Host "Close the PowerShell windows to stop the servers" -ForegroundColor Yellow
Write-Host ""
