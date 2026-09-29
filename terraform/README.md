# Cloudflare Worker Terraform Configuration

This directory contains Terraform configuration for managing and importing a Cloudflare Worker on the `dev` branch.

## Requirements

- Terraform `>= 1.5.0`
- Cloudflare API Token with permissions:
  - **Account** -> **Workers Scripts** -> **Read** & **Edit**

## Setup

1. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with:
   - `cloudflare_api_token`: Your Cloudflare API token (or export via environment variable `TF_VAR_cloudflare_api_token`).
   - `cloudflare_account_id`: Your Cloudflare account ID (defaults to `a9244ae402534aaaed2072748a928351`).
   - `worker_script_name`: The name of the Worker script as defined in Cloudflare.

3. Initialize Terraform:
   ```bash
   terraform init
   ```

## Importing the Worker

### Option 1: Using Terraform Native Import Blocks (Terraform >= 1.5)

The file `main.tf` is pre-configured with a native `import` block:

```hcl
import {
  to = cloudflare_worker.imported_worker
  id = "${var.cloudflare_account_id}/${var.worker_script_name}"
}
```

Run:
```bash
terraform plan
terraform apply
```

### Option 2: Using the CLI Import Command

You can also import directly into state using the CLI:
```bash
terraform import cloudflare_worker.imported_worker <ACCOUNT_ID>/<WORKER_SCRIPT_NAME>
```

