echo "[i] Initiating the Terraform project"
terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY/$TMP_GIT_BRANCH"

echo "[i] Printing the Terraform plan"
terraform plan -no-color

echo "[i] Applying the Terraform changes"
terraform apply -auto-approve -var "project_id=$PROJECT_ID" -var "bucket_registry=$GCP_BUCKET_REGISTRY" $EXTRA_TERRAFORM_VARS_CMD
