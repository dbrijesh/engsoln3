# Build Script for Windows PowerShell
# This script sets JAVA_HOME to JDK 17 and builds the Spring Boot application

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  HexaDemo Backend - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Set JAVA_HOME to JDK 17
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
Write-Host "JAVA_HOME set to: $env:JAVA_HOME" -ForegroundColor Green

# Verify Java version
Write-Host ""
Write-Host "Checking Java version..." -ForegroundColor Yellow
& "$env:JAVA_HOME\bin\java.exe" -version

Write-Host ""
Write-Host "Building application..." -ForegroundColor Yellow

# Build the application
.\mvnw.cmd clean package -DskipTests

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  Build Successful!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "JAR file created at: target\backend-0.0.2-SNAPSHOT.jar" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To run the application:" -ForegroundColor Yellow
    Write-Host "  .\run-backend.ps1" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  Build Failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
}
