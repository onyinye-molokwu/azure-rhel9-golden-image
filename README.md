# azure-rhel9-golden-image
Automated CIS-assessed RHEL 9 Golden Image pipeline using Packer, GitHub Actions, and Azure Compute Gallery for secure, repeatable VM deployments.
# Azure RHEL 9 Golden Image Factory

## Overview
## Project Demo

[Watch the video walkthrough] (https://www.loom.com/share/263610ce5c6a408186553284c5606462)
This project automates the creation, hardening, assessment, versioning, and publication of RHEL 9 Golden Images in Azure using Infrastructure as Code and CI/CD automation.

The solution uses Terraform to provision Azure image infrastructure, Packer to build and harden images, OpenSCAP to perform CIS security assessments, Azure Compute Gallery for image management, and GitHub Actions for automated image builds.

## Architecture Diagram

```text
                    GitHub Actions
          (Manual Trigger / Scheduled Build)
                              |
                              v
                    Azure Service Principal
                              |
                              v
                      Packer Build
                              |
                              v
                  Temporary RHEL 9 VM
                              |
          +-------------------+-------------------+
          |                                       |
          v                                       v
   CIS Hardening Script                  OpenSCAP Assessment
          |                                       |
          +-------------------+-------------------+
                              |
                              v
                       Image Capture
                              |
                              v
                  Azure Compute Gallery
                              |
                              v
                 Versioned Golden Images
```

## Technologies Used

| Technology            | Purpose                             |
| --------------------- | ----------------------------------- |
| Terraform             | Infrastructure provisioning         |
| Packer                | Image creation and automation       |
| Azure Compute Gallery | Image version management            |
| GitHub Actions        | CI/CD automation                    |
| OpenSCAP              | CIS assessment                      |
| Azure CLI             | Azure authentication and management |
| RHEL 9                | Operating system                    |
| Git                   | Source control                      |

## Repository Structure

```text
azure-rhel9-golden-image
│
├── .github/workflows/
│   └── build-golden-image.yml
│
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── packer/
│   ├── rhel9.pkr.hcl
│   ├── variables.pkrvars.hcl
│   └── scripts/
│       ├── hardening.sh
│       └── cleanup.sh
│
└── README.md
```

## Build Flow

1. GitHub Actions workflow is triggered manually or on schedule.
2. GitHub authenticates to Azure using a Service Principal.
3. Packer creates a temporary RHEL 9 VM.
4. Hardening scripts are applied.
5. OpenSCAP performs CIS assessment.
6. VM is generalized and captured.
7. Image is published to Azure Compute Gallery.
8. Temporary resources are removed automatically.

## Azure Compute Gallery Results

### Successful Image Versions

| Version | Status                       |
| ------- | ---------------------------- |
| 1.0.0   | Published                    |
| 1.0.2   | Published                    |
| 1.0.4   | Published via GitHub Actions |

### Azure Compute Gallery

* Gallery: gal_golden_images_onyinye
* Image Definition: rhel9-cis
* Region: East US

## GitHub Actions Results

### Successful Pipeline Stages

* Repository Checkout
* Azure Authentication
* Packer Initialization
* Packer Validation
* Golden Image Build
* Azure Image Publication
* Resource Cleanup

## Key Features

* Infrastructure as Code
* Automated Golden Image Creation
* CIS Security Assessment
* Azure Compute Gallery Integration
* GitHub Actions Automation
* Repeatable Image Versioning
* Secure VM Deployment Foundation

## Author

Onyinye Frances Molokwu

Linux Systems Administrator
