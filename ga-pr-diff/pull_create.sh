set -e

echo "-------------------------"
echo "[i] Changing directory"
cd sources/ || exit

echo "-------------------------"
echo "[i] Comparing the $BASE_BRANCH_NAME and $BRANCH_NAME branches"
set +e
git pull origin "$BRANCH_NAME" 2>/dev/null
set -e
git branch -a
GIT_DIFF=$(git diff "$BASE_BRANCH_NAME" "remotes/origin/$BRANCH_NAME")
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

echo "-------------------------"
echo "[i] Creating a pull request"
PR_URL=$(gh pr create -B "$BASE_BRANCH_NAME" -H "$BRANCH_NAME" --title "$TITLE" --body "$BODY")

if [ "$PR_URL" == "" ]
then
	echo "[i] No PR request opened"
	exit 1
fi

echo "-------------------------"
echo "[i] Exporting the pull request information"
PR_NUMBER=${PR_URL##*/}
echo "pr_url=$PR_URL" | tee -a "$GITHUB_OUTPUT"
echo "pr_number=$PR_NUMBER" | tee -a "$GITHUB_OUTPUT"
