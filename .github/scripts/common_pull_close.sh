PULL_REQUEST_OPENED=0

if [[ "$PR_URL" == "" ]] && [[ "$PR_NUMBER" == "" ]]
then
	echo "[i] No changes in the code, deployment are allowed"
else
	echo -e "\nPull Request URL - $PR_URL"
	echo "[i] Pull Request Number - $PR_NUMBER"

	echo -e "\n[i] Stopping the workflow to let the pull request to be approved"
	PULL_REQUEST_OPENED=1
fi

echo "::set-output name=pull_request_opened::$PULL_REQUEST_OPENED"
