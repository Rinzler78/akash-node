# if [ ! $(getent passwd $USER_ACCOUNT_NAME) ] ; then
#     echo "Creating user : $USER_ACCOUNT_NAME"
#     useradd -ms /bin/bash ${USER_ACCOUNT_NAME}
#     echo ${USER_ACCOUNT_NAME}:${USER_ACCOUNT_PASS} | chpasswd
#     usermod -aG sudo ${USER_ACCOUNT_NAME}
# fi

./update-dist.sh
./update.sh

# service ssh start

function countTimeDiff() {
    timeA=$1 # 09:59:35
    timeB=$2 # 17:32:55

    # feeding variables by using read and splitting with IFS
    IFS=: read ah am as <<< "$timeA"
    IFS=: read bh bm bs <<< "$timeB"

    # Convert hours to minutes.
    # The 10# is there to avoid errors with leading zeros
    # by telling bash that we use base 10
    secondsA=$((10#$ah*60*60 + 10#$am*60 + 10#$as))
    secondsB=$((10#$bh*60*60 + 10#$bm*60 + 10#$bs))
    DIFF_SEC=$((secondsB - secondsA))
    REVERSE_DIFF_SEC=$((secondsA - secondsB))

	echo $REVERSE_DIFF_SEC
}

diffSeconds=$(countTimeDiff 24:00:00 $(date +"%H:%M:%S"))
#Test
#diffSeconds=20
echo "Node will be kill at 0:00:00 in $diffSeconds"

if [ -f $idenaNodeBinaryPath ]; then
    echo "Starting node"
    bash ./node.start.sh
else
    echo "Missing node"
fi
