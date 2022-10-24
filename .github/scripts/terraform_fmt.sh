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
echo "[i] Formating the file content"
terraform fmt -recursive -no-color

if [ -f "backend._tf" ]
then
	echo "-------------------------"
	echo "[i] Enabling the backend"
	mv backend._tf backend.tf
fi

echo "-------------------------"
echo "[i] Deleting the Terraform internal data"
rm -vrf .terraform/

echo "-------------------------"
echo "[i] Configuring the Github settings"
git config --global user.email "github-robot@github.com[noreply]"
git config --global user.name "GitHub Robot"
git config pull.rebase true

echo "-------------------------"
echo "[i] Creating the temporary branch"
git checkout -b "$BRANCH_NAME"

echo "-------------------------"
echo "[i] Processing the content to commit"
if [ "$(git status --porcelain)" != "" ]
then
	echo -e "\n[i] Changes to commit"
	git status --porcelain 2>/dev/null

	echo -e "\n[i] Commiting the changes"
	git commit -a -m "Change in $WORKING_DIRECTORY directory"

	while true
	do
		echo -e "\n[i] Pull all the changes from the different jobs"
		git pull origin "$BRANCH_NAME"

		echo -e "\n[i] Attempt to push the changes"
		git push origin "$BRANCH_NAME" && break

		echo -e "\n[-] Commit failed - new attempt in 5 seconds"
		sleep 5
	done
else
	echo "[i] Nothing to commit"
fi
