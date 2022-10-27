echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -var "project_id=$PROJECT_ID" -var "component_name_suffix=$SUFFIX_NAME"
