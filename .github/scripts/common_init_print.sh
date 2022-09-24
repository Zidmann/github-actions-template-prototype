#!/bin/bash

echo "threads=${{ steps.param.outputs.threads }}"

echo "dir_list_dev=${{ steps.param.outputs.dir_list_dev }}"
echo "dir_list_test=${{ steps.param.outputs.dir_list_test }}"
echo "dir_list_prod=${{ steps.param.outputs.dir_list_prod }}"

echo "execute_check_and_format=${{ steps.param.outputs.execute_check_and_format }}"
echo "execute_test=${{ steps.param.outputs.execute_test }}"
echo "execute_deploy=${{ steps.param.outputs.execute_deploy }}"

echo "sha7=${{ steps.param.outputs.sha7 }}"
echo "tmp_git_branch=${{ steps.param.outputs.tmp_git_branch }}"
echo "cache_key=${{ steps.param.outputs.cache_key }}"
