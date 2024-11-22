# Cloud and DevOps Automation Toolkit

<p align="center">
  <img src="logo/cloud-toolkit-logo" alt="cloud-toolkit-logo">
</p>

This repository contains a set of automated bash scripts designed to streamline the setup of a cloud server environment for hosting applications. These scripts provide a quick and consistent way to configure and deploy applications built with Node.js and Python on an Ubuntu server. They handle essential updates, upgrades, and package installations, making it easy to set up and deploy applications on a fresh server.

## Repository Structure

The repository is organized into directories based on the type of environment setup. Each directory contains scripts tailored to specific tasks, like installing prerequisites, configuring server environments, and preparing deployment environments for Node.js and Python applications.

## Directory Structure

/node-setup/
Contains bash scripts to automate the setup of a Node.js environment on an Ubuntu server. This includes installation of Node.js, npm, and any necessary global packages. The scripts also include optional configurations for commonly used tools such as PM2 for process management and Nginx as a reverse proxy.

```bash
cloud-automation-toolkit/
├── ci_cd/                           # Continuous Integration and Continuous Deployment
│   ├── github-actions/              # GitHub Actions workflows
│   │   └── main.yml                 # Main CI/CD workflow file
│   ├── jenkins/                     # Jenkins pipeline files
│   │   └── Jenkinsfile              # Jenkins pipeline definition
│   └── scripts/                     # Reusable scripts for CI/CD tasks
│       ├── build.sh                 # Build script template
│       ├── deploy.sh                # Deployment script
│       └── test.sh                  # Test automation script
│
├── containers/                      # Containerization configurations
│   ├── Dockerfiles/                 # Reusable Dockerfiles
│   │   ├── app.Dockerfile           # Sample application Dockerfile
│   │   └── nginx.Dockerfile         # NGINX Dockerfile for reverse proxy
│   ├── docker-compose.yml           # Docker Compose file for local multi-container setups
│   └── kubernetes/                  # Kubernetes configuration files
│       ├── app-deployment.yml       # Sample deployment for app
│       ├── nginx-service.yml        # Service file for NGINX
│       └── configmap.yml            # ConfigMap for environment variables
│
├── infra/                           # Infrastructure as Code (IaC)
│   ├── terraform/                   # Terraform modules and environment configurations
│   │   ├── modules/                 # Modular Terraform code
│   │   │   ├── networking/          # Network configuration
│   │   │   ├── compute/             # Compute resources (EC2, GKE, etc.)
│   │   │   └── storage/             # Storage resources (S3, etc.)
│   │   ├── env/                     # Environment-specific configurations
│   │   │   ├── dev.tf               # Development environment variables
│   │   │   └── prod.tf              # Production environment variables
│   │   └── main.tf                  # Main Terraform entry point
│   └── ansible/                     # Configuration management scripts
│       ├── roles/                   # Reusable Ansible roles
│       │   ├── webserver/           # Role for web server setup
│       │   └── database/            # Role for database setup
│       ├── playbooks/               # High-level playbooks for specific environments
│       │   ├── site.yml             # Main playbook
│       │   └── dev.yml              # Development environment playbook
│       └── inventories/             # Inventory files for hosts
│           ├── dev.ini              # Dev environment hosts
│           └── prod.ini             # Prod environment hosts
│
├── monitoring/                      # Monitoring and logging configurations
│   ├── prometheus/                  # Prometheus configuration for metrics
│   │   └── prometheus.yml           # Prometheus configuration file
│   ├── grafana/                     # Grafana configuration files and dashboards
│   │   └── dashboard.json           # Sample Grafana dashboard configuration
│   └── logging/                     # Centralized logging configurations
│       ├── fluentd.conf             # Fluentd configuration for log aggregation
│       └── logstash.conf            # Logstash configuration file
│
├── security/                        # Security and compliance scripts
│   ├── secrets_management/          # Scripts for handling secrets
│   │   └── vault_setup.sh           # HashiCorp Vault setup script
│   └── vulnerability_scans/         # Vulnerability scanning scripts and tools
│       └── trivy_scan.sh            # Trivy scan script for Docker images
│
├── scripts/                         # Reusable general-purpose scripts
│   ├── backup.sh                    # Automated backup script
│   ├── cleanup.sh                   # Resource cleanup script
│   ├── healthcheck.sh               # Basic health check script
│   └── monitoring.sh                # Monitoring check script
│
├── templates/                       # Templates for configuration files
│   ├── nginx.conf                   # NGINX configuration template
│   ├── systemd_service.template     # Systemd service file template
│   └── env.template                 # Environment variable template
│
├── tests/                           # Test scripts and testing framework configurations
│   ├── infra_tests/                 # Infrastructure tests (e.g., with Terratest)
│   │   └── test_networking.go       # Example test for networking
│   └── script_tests/                # Tests for shell scripts
│       ├── test_backup.sh           # Test for backup script
│       └── test_cleanup.sh          # Test for cleanup script
│
├── docs/                            # Documentation for the repository
│   ├── README.md                    # Main documentation for repository overview
│   ├── SETUP.md                     # Instructions for setting up environments
│   ├── CI_CD_GUIDE.md               # Guide for CI/CD pipeline configurations
│   ├── INFRA_GUIDE.md               # Guide on IaC modules and configurations
│   └── MONITORING_GUIDE.md          # Guide for setting up monitoring and logging
│
├── .gitignore                       # Ignoring unnecessary files
├── .editorconfig                    # Editor config for consistent coding styles
├── .pre-commit-config.yaml          # Configurations for pre-commit hooks
└── LICENSE                          # License for the repository

```

### /python-setup/

Contains scripts for setting up a Python environment on an Ubuntu server. The setup includes installing Python, pip, and virtual environment management tools. These scripts also handle dependencies and configurations necessary for deploying Flask, Django, or other Python-based applications.

### /system-update/

Holds scripts to automate the updating and upgrading of the Ubuntu server’s system packages. These scripts ensure that the server has the latest security patches and software updates, optimizing stability and performance.

### /general-tools/

Contains scripts to install general tools and utilities often needed in a deployment environment. This may include Git, Docker, firewall configurations, and other useful software commonly required in server setups.

## Key Features

Automated Setup
The scripts automate every aspect of server setup, allowing you to run them once and have the server environment fully configured.

## Customizable and Modular

Each directory's scripts are modular, so you can use them independently or as a complete setup based on your project's requirements. For instance, if you need to deploy a Node.js application, simply run the relevant scripts in the node-setup directory.

## Compatibility

All scripts are compatible with Ubuntu and are optimized to ensure minimal setup time and conflict-free configurations for Node.js, Python, and system packages.

Usage
Clone the repository to your Ubuntu server:

bash

````Bash
    git clone <repository-url>
    cd <repository-directory>
````

Navigate to the directory that matches your setup needs (e.g., node-setup/ for a Node.js environment).

- **1 Make the scripts executable** :

````Bash
    chmod +x *.sh
````

- **2 Run the scripts in the order provided to ensure a successful setup** :

````bash
    ./setup-node.sh  # Example for Node.js setup
````

Follow any additional prompts to complete the configuration.

### Prerequisites

A fresh Ubuntu server instance.
Sudo privileges to allow the scripts to install and configure packages.
Example Scripts
Below is a brief description of some key scripts:

### node-setup/install-node.sh

Installs Node.js, npm, and PM2 for process management. Optionally configures Nginx as a reverse proxy for production setups.

### python-setup/install-python.sh

Sets up Python, pip, and virtualenv for Python application deployment. Can be customized for Flask or Django deployments.

### system-update/update-upgrade.sh

Automates system updates and upgrades to ensure the server is running the latest software versions.

### Contributing

Feel free to contribute by submitting pull requests for additional setup scripts, configurations, or improvements to the current scripts.
