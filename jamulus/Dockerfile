FROM alpinelinux/build-base:3.21 AS builder
RUN abuild-keygen -nai
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories; abuild-apk update
COPY --chown=buildozer apkbuilds/cbix-alpine /cbix-alpine
ENV MAKEFLAGS="-j4"
RUN cd /cbix-alpine/jamulus; abuild -rP /tmp

FROM alpine:3.21
RUN --mount=from=builder,source=/tmp/cbix-alpine,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk -X /repo add jamulus-headless
COPY jamulus/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
