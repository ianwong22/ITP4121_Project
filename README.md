# ITP4121_Project

This is the project for ITP4121, The purpose of this project is make a mutli-cloud solution

## Architecture

<img></img>

## Install CLIs
Install AWS CLI
https://aws.amazon.com/tw/cli/ <br>
Install Google CLI
https://cloud.google.com/sdk/docs/install <br>
Install Azure CLI
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli <br>
Install Terraform
https://developer.hashicorp.com/terraform/install?product_intent=terraform <br>

if needed (not installer) set global environment variables in
"system variables -> Path" to set folder path

To test CLIs <br>
AWS: <code>aws help</code> <br>
GCP: <code>gcloud help</code> <br>
Azure: <code>az help</code> <br>
terraform: <code>terraform -help</code> <br>

## Setup <br>

### GCP
Login <br>
<code>gcloud auth application-default login </code> <br>
Set current workspace <br>
<code> gcloud config set project [VALUE] </code> <br>
Create Service account
```sh
gcloud iam service-accounts create [SERVICE_ACCOUNT_NAME] \
  --display-name "[DISPLAY_NAME]"
```
Set service account role
```sh
gcloud projects add-iam-policy-binding [PROJECT_ID] \
    --member "serviceAccount:[SERVICE_ACCOUNT_EMAIL]" \
    --role roles/owner
```
Create service account key
```sh
gcloud iam service-accounts keys create [FILE_NAME].json \
  --iam-account [SERVICE_ACCOUNT_EMAIL]
```

### Azure <br>
Login: <code>az login</code> <br>
set the active subscription using the id <br>
<code>az account set -s "[id]"</code> <br>

Create the Service Principal <br>
<code>az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/[id]"</code>

Some command of this repo following HashiCorp <br>
https://github.com/hashicorp/learn-terraform-multicloud-kubernetes?tab=readme-ov-file <br>
Learn Terraform - Deploy Federated Multi-Cloud Kubernetes Clusters <br>
This is a companion repository with part of the configuration for the Deploy Federated Multi-Cloud Kubernetes Clusters tutorial. It contains Terraform configuration files for you to use to learn deploy a Consul-federated multi-cluster Kubernetes setup. <br>

## Issue
If you using this terraform <br>
AWS Learner Lab can't don't have IAM role premission <br>
To fix it <br>
After <code> terraform init </code> <br>
edit <code>aws/.terraform/modules/eks/main.tf</code> line 4 <br>
From <br>
```tf
data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
} 
```
To <br>
```tf
data "aws_iam_session_context" "current" {
    arn = var.lab_arn 
} 
```
and add the line in <code> aws/.terraform/modules/eks/variables.tf </code> <br>
Replace <b>[arnRole]</b> to you Lab ARN
```tf
variable "lab_arn" {
  default = "[arnRole]" 
}