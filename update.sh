nodeBinaryPath=$(./node.binaryDirectory.sh)
nodeBinaryDirectory=$(dirname "$nodeBinaryPath")
nodeBinaryName=$(basename "$nodeBinaryPath")

echo "Binary node path : $nodeBinaryPath"

# if [[ ! $PATH == *"$nodeBinaryPath"* ]]; then
#     echo "Add to PATH :"
#     source /etc/environment && export PATH="$PATH:$nodeBinaryPath"
#     echo $PATH
# fi

# Remote version
remoteVersion="$(bash ./node.remoteVersion.sh)"
echo "Remote version : $remoteVersion"

if [ -z "$remoteVersion" ];then
    echo "Fail to retrieve remote version"
fi

# Current version
versionFile=version
currentVersion=""

if [ -f $versionFile ]; then
    currentVersion="$(cat $versionFile)"
fi

if [ ! -f $nodeBinaryPath ]; then
    currentVersion=""
fi

echo "Current version : $currentVersion"

if [ ! -z "$remoteVersion" ] && [ "$remoteVersion" != "$currentVersion" ]; then
    echo "Downloading new node version"
    ./node.download.sh $remoteVersion
    echo "node updated to : $remoteVersion"
    echo "$remoteVersion" > version
    echo "ln -s $nodeBinaryPath /usr/bin/akash"
    ln -s $nodeBinaryPath /usr/bin/$nodeBinaryName
else
    echo "node is up to date"
fi