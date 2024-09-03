# 📦 Hexagonal Calculator Helm Chart

![Helm Chart](https://img.shields.io/badge/Helm%20Chart-v0.1.0-blue) 
![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.19+-blue)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue)
![CI/CD](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-green)

## Description

This Helm chart is designed to deploy the **Hexagonal Calculator API** on a Kubernetes cluster. The API is built with Node.js and TypeScript, following the Hexagonal Architecture pattern, which ensures that the core business logic is decoupled from external concerns like HTTP interfaces and data sources.

## Why Helm?

Helm is the best tool for managing Kubernetes applications, allowing you to define, install, and upgrade even the most complex Kubernetes apps. Using Helm for the Hexagonal Calculator ensures consistent deployments, easy rollbacks, and simplified environment management.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [1. Add the Helm Repository](#1-add-the-helm-repository)
  - [2. Deploy the Application](#2-deploy-the-application)
  - [3. Deploy in Specific Environments](#3-deploy-in-specific-environments)
  - [4. Upgrade the Deployment](#4-upgrade-the-deployment)
  - [5. Uninstall the Application](#5-uninstall-the-application)
- [Configuration](#configuration)
  - [General Settings](#general-settings)
  - [Ingress](#ingress)
  - [Autoscaling](#autoscaling)
  - [Resources](#resources)
  - [Configuration & Secrets](#configuration--secrets)
- [Advanced Topics](#advanced-topics)
  - [TLS and Security](#tls-and-security)
  - [Affinity & Tolerations](#affinity--tolerations)
  - [Monitoring](#monitoring)
- [Contribution](#contribution)
- [License](#license)

## Prerequisites

- **Kubernetes** 1.19+ 
- **Helm** 3.5+ 
- **Docker** for containerization
- **Ingress Controller** (e.g., Nginx, Traefik) for external traffic management

## Installation

### 1. Add the Helm Repository

Add the repository where the Helm chart is hosted:

```bash
helm repo add hexagonal-calculator-repo https://your-helm-repo-url/
helm repo update
```

### 2. Deploy the Application

To deploy the application with default settings:

```bash
helm install hexagonal-calculator hexagonal-calculator-repo/hexagonal-calculator
```

### 3. Deploy in Specific Environments

For environment-specific deployments, use the appropriate values file:

```bash
helm install hexagonal-calculator -f values-dev.yaml hexagonal-calculator-repo/hexagonal-calculator
```

### 4. Upgrade the Deployment

To upgrade the deployment with new values or chart versions:

```bash
helm upgrade hexagonal-calculator hexagonal-calculator-repo/hexagonal-calculator
```

### 5. Uninstall the Application

To remove the deployment:

```bash
helm uninstall hexagonal-calculator
```

## Configuration

The chart allows for extensive configuration through the `values.yaml` file. Below are some key configurations:

### General Settings

- **`replicaCount`**: Number of pod replicas to deploy.
- **`image.repository`**: Docker image repository.
- **`image.tag`**: Docker image tag.
- **`service.type`**: Kubernetes service type (`ClusterIP`, `NodePort`, `LoadBalancer`).

### Ingress

- **`ingress.enabled`**: Enable or disable Ingress.
- **`ingress.hosts`**: Configure the hostname and paths for the Ingress.
- **`ingress.tls`**: Set up TLS for secure communications.

### Autoscaling

- **`autoscaling.enabled`**: Enable or disable Horizontal Pod Autoscaler.
- **`autoscaling.minReplicas`**: Minimum number of pod replicas.
- **`autoscaling.maxReplicas`**: Maximum number of pod replicas.
- **`autoscaling.targetCPUUtilizationPercentage`**: CPU utilization target for scaling.

### Resources

- **`resources.limits`**: CPU and memory limits for pods.
- **`resources.requests`**: CPU and memory requests for pods.

### Configuration & Secrets

- **`configMap.enabled`**: Enable or disable ConfigMap usage.
- **`configMap.data`**: Key-value pairs for non-sensitive configuration data.
- **`secrets.enabled`**: Enable or disable Secrets usage.
- **`secrets.data`**: Base64-encoded key-value pairs for sensitive data.

## Advanced Topics

### TLS and Security

Integrate with Cert-Manager to automate TLS certificate management.

### Affinity & Tolerations

- **Node Affinity**: Ensure pods are scheduled on specific nodes.
- **Tolerations**: Define rules for pod scheduling on tainted nodes.

### Monitoring

Integrate Prometheus and Grafana for monitoring application metrics, especially with autoscaling enabled.

## Contribution

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Back to Top
[⬆️](#hexagonal-calculator-helm-chart)
