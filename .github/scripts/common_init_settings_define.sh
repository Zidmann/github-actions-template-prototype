echo "[i] Defining the workflow"
echo WORKFLOW_NAME=$WORKFLOW_NAME

echo "-------------------------"
echo "[i] Defining SHA based variables"
GITHUB_SHA7=${GITHUB_SHA:0:7}
echo GITHUB_SHA=$GITHUB_SHA
echo GITHUB_SHA7=$GITHUB_SHA7

echo "-------------------------"
echo "[i] Defining branch based variables"
GITHUB_BRANCH=${GITHUB_REF##*/}
echo "GITHUB_REF=$GITHUB_REF"
echo "GITHUB_BRANCH=$GITHUB_BRANCH"

echo "-------------------------"
echo "[i] Exporting basics parameters"
echo "::set-output name=sha7::$GITHUB_SHA7"
echo "::set-output name=tmp_git_branch::tmp_${WORKFLOW_NAME}_${GITHUB_SHA7}"
echo "::set-output name=cache_key::${WORKFLOW_NAME}_${GITHUB_BRANCH}_${GITHUB_SHA7}"

echo "-------------------------"
echo "[i] Defining the jobs to execute according the branch"
if [ "$GITHUB_BRANCH" == "main" ]
	then
	echo "::set-output name=execute_check_and_format::1"
	echo "::set-output name=execute_test::1"
	echo "::set-output name=execute_deploy::1"
elif [ "$GITHUB_BRANCH" == "staging" ]
then
	echo "::set-output name=execute_check_and_format::1"
	echo "::set-output name=execute_test::1"GITHUB_REF
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
echo "[i] Loading the parameters file"
source "sources/.github/params/$WORKFLOW_NAME.env"
if [ "$THREADS" == "" ]
then
	THREADS="8"
fi
if [ "$DIRECTORY_LIST_DEV" == "" ]
then
	DIRECTORY_LIST_DEV="[\".\"]"
fi
if [ "$DIRECTORY_LIST_TEST" == "" ]
then
	DIRECTORY_LIST_TEST="[\".\"]"
fi
if [ "$DIRECTORY_LIST_PROD" == "" ]
then
	DIRECTORY_LIST_PROD="[\".\"]"
fi

echo "-------------------------"
echo "[i] Exporting matrix parameters"
echo "::set-output name=threads::$THREADS"
echo "::set-output name=dir_list_dev::$DIRECTORY_LIST_DEV"
echo "::set-output name=dir_list_test::$DIRECTORY_LIST_TEST"
echo "::set-output name=dir_list_prod::$DIRECTORY_LIST_PROD"

echo "-------------------------"
echo "[i] Defining the state storing and authenticating information"
echo "::set-output name=state_gcp_bucket::$STATE_GCP_BUCKET"
echo "::set-output name=workloadidentity_projectnumber::$WORKLOADIDENTITY_PROJECTNUMBER"
echo "::set-output name=workloadidentity_provider_test::$WORKLOADIDENTITY_PROVIDER_TEST"
echo "::set-output name=workloadidentity_provider_prod::$WORKLOADIDENTITY_PROVIDER_PROD"
echo "::set-output name=serviceaccount_test::$SERVICEACCOUNT_TEST"
echo "::set-output name=serviceaccount_prod::$SERVICEACCOUNT_PROD"
