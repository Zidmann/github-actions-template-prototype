echo "threads=${{ steps.define.outputs.threads }}"

echo "dir_list_dev=${{ steps.define.outputs.dir_list_dev }}"
echo "dir_list_test=${{ steps.define.outputs.dir_list_test }}"
echo "dir_list_prod=${{ steps.define.outputs.dir_list_prod }}"

echo "execute_check_and_format=${{ steps.define.outputs.execute_check_and_format }}"
echo "execute_test=${{ steps.define.outputs.execute_test }}"
echo "execute_deploy=${{ steps.define.outputs.execute_deploy }}"

echo "sha7=${{ steps.define.outputs.sha7 }}"
echo "tmp_git_branch=${{ steps.define.outputs.tmp_git_branch }}"
echo "cache_key=${{ steps.define.outputs.cache_key }}"
