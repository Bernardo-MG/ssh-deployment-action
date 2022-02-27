# Container image that runs your code
FROM alpine:3.10

# Install dependencies
RUN apk update;
RUN apk add openssh;
RUN apk add sshpass;

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Increase permissions
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]