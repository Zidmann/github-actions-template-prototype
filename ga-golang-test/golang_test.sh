set -e

if [ "$WORKING_DIRECTORY" != "" ]
then
	echo "-------------------------"
	echo "[i] Moving to the Golang directory ($WORKING_DIRECTORY)"
	cd "$WORKING_DIRECTORY"
fi

if [ ! -f go.mod ]
then
	echo "-------------------------"
	echo "[i] Create go.mod file"
	go mod init githubaction-workflow-check
	DELETE_GO_MOD=1
fi
if [ ! -f go.sum ]
then
	echo "-------------------------"
	echo "[i] Create go.sum file"
	go mod tidy
	DELETE_GO_SUM=1
fi

echo "-------------------------"
echo "[i] Test the code"
go test -v

if [ "$DELETE_GO_MOD" == "1" ]
then
	echo "-------------------------"
	echo "[i] Delete go.mod previously created"
	rm -f "go.mod"
fi
if [ "$DELETE_GO_SUM" == "1" ]
then
	echo "-------------------------"
	echo "[i] Delete go.sum previously created"
	rm -f "go.sum"
fi
