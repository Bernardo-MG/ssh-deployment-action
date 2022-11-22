# -----------------------------------------------------------------------------
# ACTION IMAGE
#
# An image which copies and runs the action script.
#
# The SSH operations require some additional dependencies, making this action
# a bit more complex than others.
# -----------------------------------------------------------------------------
# Requires a heavier image to handle dependencies
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y sshpass

# Copy script
COPY entrypoint.sh /entrypoint.sh

# Increase permissions
RUN chmod +x /entrypoint.sh

# Run script on start
ENTRYPOINT ["/entrypoint.sh"]