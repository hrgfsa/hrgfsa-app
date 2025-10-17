# HRGFSA Hellow world Project (Poly Repo) Overview

<img width="1914" height="967" alt="image" src="https://github.com/user-attachments/assets/8acf8454-879e-4683-a036-d6945cd935cf" />


This is a simple web application stating "hellow world" on a GKE cluster which uses NGINX image.

I have made an organization HRGFSA and explicitely made three repositories using the polyrepo way i.e industry standard. The DEVOPS team would deal with HRGFSA-HELM-DEPLOYMENTS and HRGFSA-INFRA-GCP only.

This repository collection manages the deployment and infrastructure for the HRGFSA application, using Kubernetes on Google Cloud Platform (GCP), Helm for Kubernetes manifest templating, and Terraform for infrastructure provisioning.

---

## Repository Breakdown

### hrgfsa-app
- Contains the application source code and Docker configurations.
- Hosts the Docker image on Docker Hub (e.g., `danklofan/hello-world`).
- The app currently runs a simple NGINX-based hello-world application.

### hrgfsa-helm-deployments ( https://github.com/hrgfsa/hrgfsa-helm-deployments.git )
- Helm charts for deploying the HRGFSA app onto the Kubernetes cluster.
- Manages Kubernetes manifests including Deployments, Services, and Ingress resources.
- **Service type is set to ClusterIP**, meaning services are exposed internally within the cluster.
- External traffic is routed securely through an Ingress controller on hostname `hello.danklofan.com`.

### hrgfsa-infra-gcp ( https://github.com/hrgfsa/hrgfsa-infra-gcp.git  )
- Terraform code to provision, manage, and configure GCP infrastructure.
- Includes GKE cluster creation, firewall rules, IAM, and other cloud resources.

---

## Architecture and Deployment Workflow

1. **Infrastructure as Code**  
   Terraform provisions the GKE cluster and supporting cloud infrastructure. I have a prexisting GKE cluster named Autopilot-cluster-1 since I am running on GCP free tier which allows only one cluster at a time.

2. **Application Containerization**  
   The app is dockerized and pushed to Docker Hub.

3. **Kubernetes Deployment**  
   Helm charts deploy the app pods(using deployment) and services into GKE.

4. **Internal Service Exposure**  
   Kubernetes `ClusterIP` services provide stable network endpoints accessible only inside the cluster.

5. **External Access**  
   NGINX Ingress controller routes public traffic via HTTPS using the hostname `hello.danklofan.com` to these internal services.

---

## Accessing the Application

- Access the application externally via HTTPS at:  
  `https://hello.danklofan.com`

- Traffic flows through the Ingress controller, which maps requests to internal ClusterIP services.

---

## Future Enhancements

- Expand from hello-world to a full-featured application.
- Add CI/CD pipelines for automated testing and deployment.
- Strengthen security, monitoring, and scalability configurations.

---

## Contribution and Support

- Each repository manages its issues and pull requests.
- Contributions are welcome.
- Documentation and setup guides are available within respective repositories.


