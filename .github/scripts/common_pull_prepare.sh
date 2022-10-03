mkdir sources-check/
git clone "git@github.com:$GITHUB_REPOSITORY.git" --branch "$BRANCH_NAME" sources-check/
cp -r sources-check/* sources/
rm -rf sources-check/
