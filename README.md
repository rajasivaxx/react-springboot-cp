# react-and-spring-data-rest

The application has a react frontend and a Spring Boot Rest API, packaged as a single module Maven application.

You can build the application running the Dockerfile in local and port forwarding it.

![image](https://github.com/user-attachments/assets/d017c295-8715-478a-9c2e-8234819a3e09)

# CI/CD for GCP Cloud Run Deployment

This repository includes a Dockerfile and a GitHub Actions CI/CD pipeline for building and deploying a containerized application to Google Cloud Run based on the selected environment (dev, staging, or prod).

## Setup

### 1. Configure GitHub Secrets

- **`GCP_SA_KEY`**: Add your GCP Service Account Key JSON as a secret.

### 2. Configure the Pipeline

In the `.github/workflows/ci-cd.yaml` file, set the following environment variables:

- **`PROJECT_ID`**: Your GCP project ID.
- **`REGION`**: GCP region (default: `us-central1`).
- **`IMAGE_NAME`**: The name of your Docker image.
- **`SERVICE_NAME`**: The name of the Cloud Run service.

### 3. Trigger the Pipeline

The pipeline will run automatically when you push to the `main` branch. You can also manually trigger it via the GitHub Actions tab and select the environment (dev, staging, or prod).

### 4. Pipeline Steps

- **Build and Test**: Build the application using Maven and Node.js.
- **Build and Push Docker Image**: Build and push the Docker image to Google Container Registry (GCR).
- **Deploy to Cloud Run**: Deploy the Docker image to Cloud Run based on the selected environment.

### 5. Clean Up

To remove deployed services, manually delete them from the Google Cloud Console or use `terraform destroy` if you’re managing infrastructure with Terraform.

## Notes

- Ensure that the GCP Service Account has the necessary permissions for Cloud Run deployment.

