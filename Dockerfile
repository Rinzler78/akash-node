#Download base image ubuntu 16.04
FROM ubuntu:latest

# Install open-ssh server, Wget
RUN apt-get update && apt-get -y upgrade 
# RUN apt-get install -y apt-utils openssh-server wget curl htop unzip
RUN apt-get install -y apt-utils curl unzip htop

#ssh 
# RUN apt-get install -y openssh-server
# EXPOSE 22

# Update distro script
COPY update-dist.sh /update-dist.sh
RUN chmod +x /update-dist.sh
RUN /update-dist.sh

# Helpers
COPY helper.action.oneTime.sh /helper.action.oneTime.sh
RUN chmod +x /helper.*

# Node Helpers
COPY node.remoteVersion.sh /node.remoteVersion.sh
COPY node.download.sh /node.download.sh
RUN chmod +x /node.*

# Update node
COPY update.sh /update.sh
RUN chmod +x /update.sh
RUN /update.sh

# akash specific
ENV AKASH_KEY_NAME ""
RUN echo "akash key name : $AKASH_KEY_NAME"

## akash account creation
COPY akash.start.sh /akash.start.sh
COPY akash.createAccount.sh /akash.createAccount.sh
RUN chmod +x /akash.*

# node
COPY node.start.sh /node.start.sh
RUN chmod +x /node.start.sh

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh

# user
# ENV USER_ACCOUNT_NAME nodeUser
# ENV USER_ACCOUNT_PASS nodeUserPass

# RUN groupadd -g 999 nodeGroup && \
#     useradd -r -u 999 -g nodeGroup $USER_ACCOUNT_NAME
# USER $USER_ACCOUNT_NAME
# CMD ["echo", "$USER_ACCOUNT_PASS"]
