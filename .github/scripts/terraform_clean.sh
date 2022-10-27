echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -var "project_id=$PROJECT_ID" -var "suffix_name=$SUFFIX_NAME"
