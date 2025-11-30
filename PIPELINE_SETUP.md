# Azure DevOps Pipeline Setup Guide

This document provides instructions on how to set up the Azure DevOps pipeline for the Hexademo application.

## Prerequisites

1.  **Azure DevOps Project**: You need an active Azure DevOps project.
2.  **Azure Subscription**: Access to create resources (AKS, ACR, App Gateway).
3.  **Service Connections**: You need to create the following Service Connections in Azure DevOps (Project Settings -> Service connections):
    *   **Docker Registry**:
        *   Name: `myAcrConnection` (or update `azure-pipelines.yml`)
        *   Type: Azure Container Registry
        *   Subscription: Your Azure Subscription
        *   Registry: Your ACR instance
    *   **Kubernetes**:
        *   Name: `myAksConnection` (or update `azure-pipelines.yml`)
        *   Type: Azure Kubernetes Service
        *   Subscription: Your Azure Subscription
        *   Cluster: Your AKS cluster
4.  **Variable Group**:
    *   Create a Variable Group named `devops-variable-group` in Library.
    *   Add any secret variables needed (e.g., `DB_PASSWORD`, `OAUTH_CLIENT_SECRET`).

## Pipeline Configuration

1.  **Create Pipeline**:
    *   Go to Pipelines -> New Pipeline.
    *   Select **Azure Repos Git**.
    *   Select your repository.
    *   Select **Existing Azure Pipelines YAML file**.
    *   Path: `/azure-pipelines.yml`.

2.  **Variables in YAML**:
    *   Open `azure-pipelines.yml`.
    *   Update `containerRegistry` with your ACR login server (e.g., `myacr.azurecr.io`).
    *   Update `TARGET_URL` in the DAST stage with your App Gateway public IP or DNS.

## Pipeline Features

The pipeline is configured with the following stages:

### 1. Build_Test_Scan
*   **Backend**:
    *   Installs Java 17.
    *   Runs `mvn verify`:
        *   **Unit Tests**: JUnit
        *   **Integration Tests**: Cucumber (via Failsafe)
        *   **Checkstyle**: Code analysis
        *   **JaCoCo**: Code coverage
    *   **SAST**: SonarQube (Placeholder script included).
    *   **Container Scan**: Trivy scans the built Docker image.
    *   **Artifacts**: Publishes Test Results, Code Coverage, and Trivy HTML Report.
*   **Frontend**:
    *   Installs Node.js.
    *   Runs `npm install`.
    *   **Linting**: ESLint.
    *   **Unit Tests**: Vitest (with Coverage).
    *   **Container Scan**: Trivy scans the built Docker image.
    *   **Artifacts**: Publishes Test Results, Code Coverage, and Trivy HTML Report.

### 2. Deploy
*   Deploys the application to AKS using Helm.
*   Uses `helm/hexademo-chart`.
*   Updates image tags dynamically based on the Build ID.

### 3. DAST_Scan
*   Runs **OWASP ZAP** against the deployed application.
*   Generates and publishes an HTML report.
*   **Note**: Ensure the `TARGET_URL` is accessible from the build agent (or use a self-hosted agent in the VNet).

## Reports
*   **Test Results**: View in the "Tests" tab of the pipeline run.
*   **Code Coverage**: View in the "Code Coverage" tab.
*   **Trivy & ZAP Reports**: Download from the "Published Artifacts" (drop) of the pipeline run.

## Azure Entra ID Integration
The application is configured to use Azure Entra ID (OAuth2). Ensure your `backend-config` or `backend-secrets` in Helm (or Kubernetes secrets) are populated with:
*   `TENANT_ID`
*   `CLIENT_ID`
*   `CLIENT_SECRET` (if applicable)
*   `ISSUER_URI`

The pipeline does not stop on scan failures (`continueOnError: true`), allowing you to review the reports without blocking deployment.
