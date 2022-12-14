set -e

echo "-------------------------"
echo "[i] Creating SSH directory"
SSH_DIR="$HOME/.ssh"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

echo "-------------------------"
echo "[i] Adding the GitHub keys in the known hosts"
KNOWN_HOSTS_FILE="$SSH_DIR/known_hosts"

touch "$KNOWN_HOSTS_FILE"
chmod 644 "$KNOWN_HOSTS_FILE"

{ printf 'github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=\n';
printf 'github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl\n';
printf 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==\n'; } >> "$KNOWN_HOSTS_FILE"
chmod 644 "$KNOWN_HOSTS_FILE"

echo "-------------------------"
echo "[i] Adding the SSH private key"
GITHUB_KEY="$SSH_DIR/key-github"

touch "$GITHUB_KEY"
chmod 600 "$GITHUB_KEY"

echo "$SSH_PRIVATE_KEY" >> "$GITHUB_KEY"

echo "-------------------------"
echo "[i] Configuring the SSH agent"
eval "$(ssh-agent)"
ssh-add "$GITHUB_KEY"

echo "-------------------------"
echo "[i] Configuring the GIT command"
git config --global --replace-all url."git@key-github.github.com:$GITHUB_REPOSITORY".insteadOf "https://github.com/$GITHUB_REPOSITORY"
git config --global --add url."git@key-github.github.com:$GITHUB_REPOSITORY".insteadOf "git@github.com:$GITHUB_REPOSITORY"
git config --global --add url."git@key-github.github.com:$GITHUB_REPOSITORY".insteadOf "ssh://git@github.com/$GITHUB_REPOSITORY"

SSH_CONFIG="$SSH_DIR/config"
{ echo "";
echo "Host key-github.github.com";
echo "    HostName github.com";
echo "    IdentityFile $GITHUB_KEY";
echo "    IdentitiesOnly yes"; } >> "$SSH_CONFIG"
