#!/bin/bash

WORKFLOW_NAME=$1
GITHUB_SHA7=${GITHUB_SHA:0:7}
GITHUB_BRANCH=${GITHUB_REF##*/}

echo "-------------------------"
echo GITHUB_SHA="$GITHUB_SHA"
echo GITHUB_SHA7="$GITHUB_SHA7"
echo "-------------------------"
echo GITHUB_REF="$GITHUB_REF"
echo GITHUB_BRANCH="$GITHUB_BRANCH"
echo "-------------------------"

echo "::set-output name=sha7::$GITHUB_SHA7"
echo "::set-output name=tmp_git_branch::tmp_${WORKFLOW_NAME}_${GITHUB_SHA7}"
echo "::set-output name=cache_key::${WORKFLOW_NAME}_${GITHUB_BRANCH}_${GITHUB_SHA7}-"

echo "-------------------------"
if [ "$GITHUB_BRANCH" == "main" ]
then
	echo "::set-output name=execute_check_and_format::1"
	echo "::set-output name=execute_test::1"
	echo "::set-output name=execute_deploy::1"
elif [ "$GITHUB_BRANCH" == "staging" ]
then
	echo "::set-output name=execute_check_and_format::1"
	echo "::set-output name=execute_test::1"
	echo "::set-output name=execute_deploy::0"
elif [ "$GITHUB_BRANCH" == "develop" ]
then
	echo "::set-output name=execute_check_and_format::1"
	echo "::set-output name=execute_test::0"
	echo "::set-output name=execute_deploy::0"
else
	echo "[-] Error unaccepted branch name"
	exit 1
fi

echo "-------------------------"
source ".github/params/$WORKFLOW_NAME.env"
echo "::set-output name=threads::$THREADS"
echo "::set-output name=dir_list_dev::$DIRECTORY_LIST_DEV"
echo "::set-output name=dir_list_test::$DIRECTORY_LIST_TEST"
echo "::set-output name=dir_list_prod::$DIRECTORY_LIST_PROD"
echo "-------------------------"

exit0
