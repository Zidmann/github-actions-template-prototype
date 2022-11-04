set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the Terraform directory ($WORKING_DIRECTORY)"
	cd "$WORKING_DIRECTORY"
fi

if [[ "$INIT_ALREADY_DONE" == "" ]] || [[ "$INIT_ALREADY_DONE" == "0" ]]
then
	echo "-------------------------"
	echo "[i] Initiating the Terraform project"
	terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY/$STATE_KEY"
fi

echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -auto-approve -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"
