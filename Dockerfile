# FROM alpine:3.13

# RUN apk --update --no-cache add nodejs npm jq curl bash git docker

# RUN npm install -g yarn

# # Install esbuild
# # (unsafe-perm because esbuild has a postinstall script)
# ARG ESBUILD_VERSION=0
# RUN yarn config set unsafe-perm true
# RUN yarn global add esbuild

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

FROM node:lts

# Install esbuild
# (unsafe-perm because esbuild has a postinstall script)
ARG ESBUILD_VERSION=0
RUN yarn config set unsafe-perm true
RUN yarn global add esbuild@$ESBUILD_VERSION

# # Install docker
# RUN yum install amazon-linux-extras -y
# RUN amazon-linux-extras install docker -y

# Disable npm update notifications
RUN npm config --global set update-notifier false

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]