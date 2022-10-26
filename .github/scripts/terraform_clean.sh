echo "-------------------------"
echo "[i] Removing the Terraform project components"
terraform destroy -var "suffix_name=$SUFFIX_NAME" $EXTRA_TERRAFORM_VARS_CMD
