echo "-------------------------"
echo "[i] Initiating the Terraform project"
terraform init

echo "-------------------------"
echo "[i] Validate the content of the Terraform project"
terraform validate -no-color
