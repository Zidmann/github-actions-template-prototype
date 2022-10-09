echo "[i] Changing directory"
cd sources/

echo "[i] Comparing the $BASE_BRANCH_NAME and $BRANCH_NAME branches"
git checkout "$BRANCH_NAME"
NB_DIFF=$(git diff "$BASE_BRANCH_NAME" "$BRANCH_NAME")
if [ "$NB_DIFF" == "0" ]
then
	echo "[i] No changes to merge in a pull request"
	exit 0
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
echo "PR_URL=$PR_URL"
echo "PR_NUMBER=$PR_NUMBER"
echo "::set-output name=pr_url::$PR_URL"
echo "::set-output name=pr_number::$PR_NUMBER"
