echo "[i] Creating temporary checking directory"
mkdir sources-check/

echo "[i] Copying changes in the temporary checking directory"
git clone "git@github.com:$GITHUB_REPOSITORY.git" --branch "$BRANCH_NAME" sources-check/
cp -r sources-check/* sources/

echo "[i] Removing temporary checking directory"
rm -rf sources-check/
