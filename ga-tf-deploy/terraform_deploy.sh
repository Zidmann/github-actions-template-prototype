set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the Terraform directory ($WORKING_DIR)"
	cd "$WORKING_DIR"
fi

echo "-------------------------"
echo "[i] Initiating the Terraform project"
terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY/$STATE_KEY"

echo "-------------------------"
echo "[i] Printing the Terraform plan"
terraform plan -no-color -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"

echo "-------------------------"
echo "[i] Applying the Terraform changes"
terraform apply -auto-approve -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"
