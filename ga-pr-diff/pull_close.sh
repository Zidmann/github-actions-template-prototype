set -e

PULL_REQUEST_OPENED=0

echo "-------------------------"
if [[ "$PR_URL" == "" ]] && [[ "$PR_NUMBER" == "" ]]
then
	echo "[i] No changes in the code, deployments are allowed"
else
	echo "[i] Pull Request URL - $PR_URL"
	echo "[i] Pull Request Number - $PR_NUMBER"

	echo "-------------------------"
	echo "[i] Stopping the workflow to let the pull request to be approved"
	PULL_REQUEST_OPENED=1
fi

echo "-------------------------"
echo "pull_request_opened=$PULL_REQUEST_OPENED" | tee -a "$GITHUB_OUTPUT"
