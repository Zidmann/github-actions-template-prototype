set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the Terraform directory ($WORKING_DIRECTORY)"
	cd "$WORKING_DIRECTORY"
fi

if [ -f "backend.tf" ]
then
	echo "-------------------------"
	echo "[i] Disabling the backend"
	mv backend.tf backend._tf
fi

echo "-------------------------"
echo "[i] Initiating the Terraform project"
terraform init

echo "-------------------------"
echo "[i] Validate the content of the Terraform project"
terraform validate -no-color

if [ -f "backend._tf" ]
then
	echo "-------------------------"
	echo "[i] Enabling the backend"
	mv backend._tf backend.tf
fi
