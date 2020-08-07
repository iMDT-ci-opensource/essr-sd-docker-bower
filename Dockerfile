FROM node:12-alpine

# Add bower binary
RUN npm install -g bower nc

# Add other dependencies
RUN apk add bash git


# Change current user to node
USER node

RUN mkdir /tmp/build

# Feeds bower local cache
ADD bower.json /tmp/build/
ADD ./docker-scripts/bower-install-loop.sh /tmp/build/
RUN sh -c "cd /tmp/build; ls ; /tmp/build/bower-install-loop.sh"
RUN rm -rf /tmp/build

WORKDIR /data

# The real command is specified in docker-compose.yml
CMD ["sleep", "10"]


