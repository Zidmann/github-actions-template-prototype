set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the Terraform directory ($WORKING_DIRECTORY)"
	cd "$WORKING_DIRECTORY"
fi

echo "-------------------------"
echo "[i] Validate the content of the shell project"
find . -type f -name "*.sh" -exec shellcheck --shell=bash {} +
