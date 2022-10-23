FILE_PATH="$*"
TMP_PATH="/tmp/function_replace_variables.tmp"

envsubst < "$FILE_PATH" > "$TMP_PATH"
cp "$TMP_PATH" "$FILE_PATH"
rm "$TMP_PATH"
