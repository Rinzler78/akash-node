docker rmi --force /$(cat helper.docker.name.sh)

#!/bin/bash
echo "Clean images"
docker image prune -f
docker image prune -a -f

echo "Clean containers"
docker container prune -f

echo "Clean voumes"
docker volume prune -f

echo "Clean networks"
docker network prune -f

echo "Clean all system"
docker system prune -f

