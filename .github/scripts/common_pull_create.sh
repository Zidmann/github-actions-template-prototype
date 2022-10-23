echo "[i] Changing directory"
cd sources/

echo "[i] Comparing the $BASE_BRANCH_NAME and $BRANCH_NAME branches"
GIT_DIFF=$(git diff "$BASE_BRANCH_NAME" "remotes/origin/$BRANCH_NAME")
if [ "$?" != "0" ]
then
	echo "[-] Error during comparing the branches"
	exit 1
fi
NB_DIFF=$(echo "$GIT_DIFF" | awk NF | wc -l)
if [ "$NB_DIFF" == "0" ]
then
	echo "[i] No changes to merge in a pull request"
	echo "[i] Deleting the $BRANCH_NAME branch"
	git push -d origin "$BRANCH_NAME"
	exit 0
else
	echo "[i] Changes detected to merge"
fi

echo "[i] Creating a pull request"
PR_URL=$(gh pr create -B "$BASE_BRANCH_NAME" -H "$BRANCH_NAME" --title "$TITLE" --body "$BODY")
if [ "$?" != "0" ]
then
	echo "[-] Error during opening the pull request"
	exit 1
fi

if [ "$PR_URL" == "" ]
then
	echo "[i] No PR request opened"
	exit 1
fi

echo "[i] Exporting the pull request information"
PR_NUMBER=${PR_URL##*/}
echo "pr_url=$PR_URL" | tee -a $GITHUB_OUTPUT
echo "pr_number=$PR_NUMBER" | tee -a $GITHUB_OUTPUT
