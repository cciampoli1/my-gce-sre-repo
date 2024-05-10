# my-gce-sre-repo
# GCE SRE Toolkit Repository

## Repository Contents

### `bash_scripts/`
This directory contains various Bash scripts that automate tasks across different aspects of system and network management.

- **VM Deployment**: Scripts for deploying VMs of various sizes in GCE, catering to different load and performance requirements.
- **Container Management**: Scripts to manage Docker containers, including pulling images, building from Dockerfiles, and updating containers in deployment.
- **Backup Automation**: A script for automating the snapshot process of GCP disks, crucial for data recovery strategies.
- **System Management**: Includes scripts for system updates, log rotation, disk space monitoring, and performance monitoring, ensuring systems are up-to-date, secure, and performing optimally.
- **User Management**: Manages user accounts on systems, automating creation, modification, and deletion processes.
- **Network Configuration**: Configures network settings like firewall rules and network interfaces.
- **Disaster Recovery**: Scripts for backing up essential data and ensuring it can be restored in the event of a system failure.

### `terraform/`
Terraform configurations for provisioning and managing infrastructure as code, ensuring consistent and reproducible setups across environments.

- **VM Deployment**: Terraform configurations for setting up virtual machines in GCP.
- **Container Deployment**: Configurations for deploying and managing Kubernetes clusters through GKE.
- **Security**: Terraform scripts for setting up firewall rules and other security measures in GCP.

### `helm_charts/`
Helm charts for deploying and managing applications in Kubernetes environments, enabling scalable and manageable deployments.

- **Nginx**: A web server and reverse proxy Helm chart, ideal for serving static content or as a proxy.
- **Redis**: An open-source key-value store that supports data structures such as strings, hashes, lists, sets, and sorted sets with range queries.
- **Prometheus**: Monitoring and alerting toolkit Helm chart, widely used for its robust monitoring capabilities in Kubernetes environments.

### `ci_cd_pipelines/`
CI/CD pipeline configurations using GitHub Actions, automating the build, test, and deployment processes to ensure continuous integration and delivery.

- **Basic CI Pipeline**: Automates the process of code linting, testing, and building, suitable for any application within the repository.
- **Enhanced CI/CD Pipeline**: Includes security scanning and automated deployment to Kubernetes, ensuring high standards of security and reliability are maintained.



