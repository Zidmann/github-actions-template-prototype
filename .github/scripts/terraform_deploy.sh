echo "-------------------------"
echo "[i] Initiating the Terraform project"
terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY"

echo "-------------------------"
echo "[i] Printing the Terraform plan"
terraform plan -no-color

echo "-------------------------"
echo "[i] Applying the Terraform changes"
terraform apply -auto-approve -var "suffix_name=$SUFFIX_NAME" $EXTRA_TERRAFORM_VARS_CMD
