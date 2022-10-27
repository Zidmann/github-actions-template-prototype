echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -auto-approve -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"
