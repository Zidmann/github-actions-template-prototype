echo "-------------------------"
echo "[i] Initiating the Terraform project"
terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY/$STATE_KEY"

echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -auto-approve -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"
