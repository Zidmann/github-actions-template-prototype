if [ "$PROJECT_PREFIX" == "" ]
then
	echo "[i] No project prefix defined, all the GCP targets will be hidden"
	echo "::add-mask::$CLOUDSDK_CORE_PROJECT"
	echo "::add-mask::$CLOUDSDK_PROJECT" 
	echo "::add-mask::$GCLOUD_PROJECT" 
	echo "::add-mask::$GCP_PROJECT" 
	echo "::add-mask::$GOOGLE_CLOUD_PROJECT"  
else
	echo "[i] Project prefix to mask defined"
fi
