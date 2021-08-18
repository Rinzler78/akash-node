ACTION_NAME=$1
ACTION_TO_EXECUTE=$2

if [[ $# -ne 2 ]]; then
 echo "Error: Missing arguments"
 exit
fi

if [ -z "$ACTION_NAME" ]
  then
    echo "Error : Missing action name"
    exit
fi

if [[ -f "$ACTION_NAME" ]]; then
    echo "$ACTION_NAME allready done"
    exit
fi

if [ -z "$ACTION_TO_EXECUTE" ]
  then
    echo "Error : Missing action to execute"
    exit
fi

echo "Executing action : $ACTION_TO_EXECUTE"
bash $ACTION_TO_EXECUTE &&\
echo "OK" > ./action.$ACTION_NAME.done.txt &&\
echo "./action.$ACTION_NAME.done.txt created"
