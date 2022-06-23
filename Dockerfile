FROM alpine:3.13

RUN apk --update --no-cache add nodejs npm jq curl bash git docker

RUN npm install -g yarn

# Install esbuild
# (unsafe-perm because esbuild has a postinstall script)
ARG ESBUILD_VERSION=0
RUN yarn config set unsafe-perm true
RUN yarn global add esbuild@$ESBUILD_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
