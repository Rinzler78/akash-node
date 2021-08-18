echo "Building $(cat ./helper.docker.name.sh)"
./helper.docker.clean.sh
./helper.docker.build.sh
./helper.docker.run.sh
