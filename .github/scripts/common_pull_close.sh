if [[ "$PR_URL" == "" ]] && [[ "$PR_NUMBER" == "" ]]
then
	echo "[i] No changes in the code, deployment are allowed"
else
	echo "[i] Configuring the Github settings"
	git remote add originssh "git@github.com:$GITHUB_REPOSITORY.git"
	git push originssh --delete "$BRANCH_NAME"

	echo -e "\nPull Request URL - $PR_URL"
	echo "[i] Pull Request Number - $PR_NUMBER"

	echo "[i] Stopping the workflow to let the pull request to be approved"
	exit 1
fi
