set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the shell directory ($WORKING_DIRECTORY)"
	cd "$WORKING_DIRECTORY"
fi

echo "-------------------------"
if [ "$PACKAGE_TYPE" == "DEB" ]
then
	echo "[i] Replace the variables by values"
	sed "s/\$PACKAGE_VERSION/$PACKAGE_VERSION/g" "DEBIAN/control"

	echo "[i] Compile the directory in a debian package"
	dpkg-deb --build . "$PACKAGE_FILENAME"
elif [ "$PACKAGE_TYPE" == "RPM" ]
then
	echo "[i] Compile the directory in a RedHat package"
else
	echo "[-] Unknown package type"
	exit 1
fi
