# Part 1: Shared Hosting Platform Architecture

## 📘 Introduction

This part covers the Azure infrastructure that powers the shared hosting platform. The focus is on a scalable, secure, and efficient design to support multi-tenant PHP-based applications (like WordPress) hosted on a LAMP stack.

---

## 🧱 Topics Covered

1. [Architecture Overview](#architecture-overview)
2. [Resource Considerations](#resource-considerations)
3. [Connection Flow](#connection-flow)

---

## 🏗️ Architecture Overview

The solution is built on a **Hub-and-Spoke Network Topology**:

### 🔹 Hub Network

Contains shared services used by all environments:

- **Azure Bastion** – Secure VM access
- **Azure Front Door** – SSL termination, global traffic management, WAF
- **Azure NetApp Files** – Shared storage across VMs
- **Azure Key Vault** – Secret and certificate management

### 🔸 Spoke Networks

Isolated VNets for:

- **Production** – Live hosted websites
- **Preproduction** – Staging and testing workloads

> 🛡️ **Key Advantages:**

- Network isolation between environments
- Centralized monitoring and access control
- Easy to scale by adding new spokes
- Cost savings via shared core services

---

## 🔧 Resource Considerations

### 🔐 Traffic & Security

- **Azure Front Door**: Routes public traffic, handles SSL, and enforces WAF rules
- **Azure Load Balancer**: Distributes traffic to backend VMs
- **NSGs**: Allow only ports 80/443 from internet, strict rules otherwise

### 🖥️ Compute & Storage

- **VMs (Ubuntu 24.04)**: Host Apache for PHP apps
- **Azure NetApp Files**: High-performance, shared NFS storage
- **Azure Database for MySQL**: Managed DB service with backups and scaling

### 🔑 Secrets Management

- **Azure Key Vault**: Stores app secrets and TLS certificates, integrated with Front Door and VMs

### 🔒 Network Isolation

All components except Front Door are in private subnets—no direct internet exposure.

---

## 🔁 Connection Flow

1. **User** accesses the app using HTTPS.
2. **Azure Front Door** routes the request based on URL path.
3. **Azure Load Balancer** sends the request to available VMs.
4. **Web Servers (Apache)** serve app files from Azure NetApp Files.
5. **App** connects to Azure Database for MySQL.

```mermaid
flowchart TD
    User[User (Internet)] --> FrontDoor[Azure Front Door]
    FrontDoor --> LoadBalancer[Azure Load Balancer]
    LoadBalancer --> VM1[Web Server VM1]
    LoadBalancer --> VM2[Web Server VM2]
    VM1 --> NetApp[Azure NetApp Files]
    VM2 --> NetApp
    VM1 --> DB[Azure MySQL]
    VM2 --> DB
```
