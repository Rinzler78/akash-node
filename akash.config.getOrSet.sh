exec 4<&1
exec 1>trash

VALUE_NAME=$1
ENV_VALUE="$2"
SCRIPT="$3"

#echo "All ($#) : $@"
#echo "VALUE_NAME => $VALUE_NAME"
#echo "ENV_VALUE => $ENV_VALUE"
#echo "SCRIPT => $SCRIPT"

if [ -z "$VALUE_NAME" ];then
    echo "Error : Missing value name"
    exit
fi

if [ -z "$ENV_VALUE" ];then
    echo "Warning : $VALUE_NAME not set. Try to get from local storage"
    ENV_VALUE=$(./akash.config.get.sh "$VALUE_NAME")
    
    if [ -z "$VALUE" ];then
        echo "Warning : $VALUE_NAME not found. Using provided value"
        ENV_VALUE=$($SCRIPT)
        ./akash.config.set.sh "$VALUE_NAME" "$ENV_VALUE"
    fi
fi

exec 1<&4
echo "$ENV_VALUE"
#eval $VALUE_NAME=$VALUE
