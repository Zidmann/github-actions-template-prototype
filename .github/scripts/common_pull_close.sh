git remote add originssh "git@github.com:$GITHUB_REPOSITORY.git"
git push originssh --delete "$BRANCH_NAME"

echo "Pull Request URL - $PR_URL"
echo "Pull Request Number - $PR_NUMBER"
