#Download base image ubuntu 16.04
FROM ubuntu:latest

## scripts
COPY *.sh /
RUN chmod +x /*.sh

# Install open-ssh server, Wget
RUN apt-get update
# RUN apt-get install -y apt-utils openssh-server wget curl htop unzip
RUN apt-get install -y apt-utils curl
RUN apt-get install -y apt-utils jq
RUN apt-get install -y apt-utils unzip
# RUN apt-get install -y apt-utils htop

# RUN /update-dist.sh

# akash specific
ENV AKASH_NET "https://raw.githubusercontent.com/ovrclk/net/master/mainnet"
ENV AKASH_KEY_NAME "akashNodeName"
ENV AKASH_NODE ""
ENV AKASH_ACCOUNT_ADDRESS ""
ENV AKASH_CHAIN_ID ""
ENV AKASH_MONIKER ""
ENV AKASH_GAS_PRICE ""

# CMD ./akash.env.dump.sh && . ./akash.env.init.sh && ./akash.env.dump.sh && cat akash.config.json
# RUN . ./akash.env.init.sh
# Update node
RUN /update.sh

CMD bash /start.sh