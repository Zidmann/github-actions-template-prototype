set -e

echo "-------------------------"
echo "[i] Defining the workflow"
echo "WORKFLOW_NAME=$WORKFLOW_NAME"

echo "-------------------------"
echo "[i] Defining SHA based variables"
GITHUB_SHA7=${GITHUB_SHA:0:7}
echo "GITHUB_SHA=$GITHUB_SHA"
echo "GITHUB_SHA7=$GITHUB_SHA7"

echo "-------------------------"
echo "[i] Defining branch based variables"
GITHUB_BRANCH=${GITHUB_REF##*/}
echo "GITHUB_REF=$GITHUB_REF"
echo "GITHUB_BRANCH=$GITHUB_BRANCH"

echo "-------------------------"
echo "[i] Exporting basics parameters"
echo "sha7=$GITHUB_SHA7" | tee -a "$GITHUB_OUTPUT"
echo "git_branch=$GITHUB_BRANCH" | tee -a "$GITHUB_OUTPUT"
if [ "$WORKFLOW_NAME" == "terraform" ]
then
	echo "tmp_git_branch=tmp_${WORKFLOW_NAME}_${GITHUB_SHA7}" | tee -a "$GITHUB_OUTPUT"
fi
echo "cache_key=${WORKFLOW_NAME}_${GITHUB_BRANCH}_${GITHUB_SHA7}" | tee -a "$GITHUB_OUTPUT"

echo "-------------------------"
echo "[i] Defining the jobs to execute according the branch"
if [ "$GITHUB_BRANCH" == "main" ]
	then
	echo "execute_check_and_format=1" | tee -a "$GITHUB_OUTPUT"
	echo "execute_test=1" | tee -a "$GITHUB_OUTPUT"
	echo "execute_deploy=1" | tee -a "$GITHUB_OUTPUT"
elif [ "$GITHUB_BRANCH" == "staging" ]
then
	echo "execute_check_and_format=1" | tee -a "$GITHUB_OUTPUT"
	echo "execute_test=1" | tee -a "$GITHUB_OUTPUT"
	echo "execute_deploy=0" | tee -a "$GITHUB_OUTPUT"
elif [ "$GITHUB_BRANCH" == "develop" ]
then
	echo "execute_check_and_format=1" | tee -a "$GITHUB_OUTPUT"
	echo "execute_test=0" | tee -a "$GITHUB_OUTPUT"
	echo "execute_deploy=0" | tee -a "$GITHUB_OUTPUT"
else
	echo "[-] Error : unaccepted branch name"
	exit 1
fi

echo "-------------------------"
echo "[i] Loading the parameters file"
if [ "$ENV_PATH" == "" ]
then
	echo "[i] No environment file defined"
elif [ -f "$ENV_PATH" ]
then
	source "$ENV_PATH"
else
	echo "[-] Error : configuration file was not found"
	exit 1
fi

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
echo "threads=$THREADS" | tee -a "$GITHUB_OUTPUT"
echo "dir_list_dev=$DIRECTORY_LIST_DEV" | tee -a "$GITHUB_OUTPUT"
echo "dir_list_test=$DIRECTORY_LIST_TEST" | tee -a "$GITHUB_OUTPUT"
echo "dir_list_prod=$DIRECTORY_LIST_PROD" | tee -a "$GITHUB_OUTPUT"

if [ "$WORKFLOW_NAME" == "terraform" ]
then
	echo "-------------------------"
	echo "[i] Defining the state storing and authenticating information"
	echo "state_gcp_bucket=$STATE_GCP_BUCKET" | tee -a "$GITHUB_OUTPUT"
fi

echo "-------------------------"
echo "[i] Defining the authentication information"
if [ "$WORKLOADIDENTITY_PROJECTNUMBER" != "" ]
then
	WORKLOADIDENTITY_PROVIDER_TEST=projects/$WORKLOADIDENTITY_PROJECTNUMBER/locations/global/workloadIdentityPools/$WORKLOADIDENTITY_PROVIDER_TEST
	WORKLOADIDENTITY_PROVIDER_PROD=projects/$WORKLOADIDENTITY_PROJECTNUMBER/locations/global/workloadIdentityPools/$WORKLOADIDENTITY_PROVIDER_PROD
	echo "workloadidentity_provider_test=$WORKLOADIDENTITY_PROVIDER_TEST" | tee -a "$GITHUB_OUTPUT"
	echo "workloadidentity_provider_prod=$WORKLOADIDENTITY_PROVIDER_PROD" | tee -a "$GITHUB_OUTPUT"
fi
echo "workloadidentity_provider_test=$WORKLOADIDENTITY_PROVIDER_TEST" | tee -a "$GITHUB_OUTPUT"
echo "workloadidentity_provider_prod=$WORKLOADIDENTITY_PROVIDER_PROD" | tee -a "$GITHUB_OUTPUT"
if [ "$WORKLOADIDENTITY_PROVIDER_TEST" != "" ]
then
	echo "token_format_test=access_token" | tee -a "$GITHUB_OUTPUT"
	echo "access_token_lifetime=900s" | tee -a "$GITHUB_OUTPUT"
fi
if [ "$WORKLOADIDENTITY_PROVIDER_PROD" != "" ]
then
	echo "token_format_prod=access_token" | tee -a "$GITHUB_OUTPUT"
	echo "access_token_lifetime=900s" | tee -a "$GITHUB_OUTPUT"
fi
