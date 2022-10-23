find sources/ -type f -exec "${{ env.GITHUB_WORKSPACE }}/sources/.github/scripts/function_replace_variables.sh" {} \;
