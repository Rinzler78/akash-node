nodeBinaryPath=$(./node.binaryDirectory.sh)
nodeBinaryDirectory=$(dirname "$nodeBinaryPath")
nodeBinaryName=$(basename "$nodeBinaryPath")

# echo "Binary node path : $nodeBinaryPath"
# echo "Binary directory : $nodeBinaryDirectory"
# echo "Binary name : $nodeBinaryName"

# if [[ ! $PATH == *"$nodeBinaryPath"* ]]; then
#     echo "Add to PATH :"
#     source /etc/environment && export PATH="$PATH:$nodeBinaryPath"
#     echo $PATH
# fi

# Remote version
remoteVersion="$(./node.remoteVersion.sh)"
echo "Remote version : $remoteVersion"

if [ -z "$remoteVersion" ];then
    echo "Fail to retrieve remote version"
    exit
fi

# Current version
currentVersion=$(./node.version.sh)

if [ ! -f $nodeBinaryPath ]; then
    currentVersion=""
fi

echo "Current version : $currentVersion"

if [ ! -z "$remoteVersion" ] && [ "$remoteVersion" != "$currentVersion" ]; then
    echo "Downloading version ($remoteVersion)"
    ./node.download.sh $remoteVersion
    echo "Updated to : $remoteVersion"
    echo "ln -s $nodeBinaryPath /usr/bin/akash"
else
    echo "node is up to date"
fi

if [ ! -f /usr/bin/$nodeBinaryName ]; then
    ln -s $nodeBinaryPath /usr/bin/$nodeBinaryName
fi

echo "**** Update ***"