FROM alpinelinux/build-base:3.21 AS builder
RUN abuild-keygen -nai
RUN (echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" | doas -u root tee -a /etc/apk/repositories) && abuild-apk update
ADD --chown=buildozer https://github.com/cbix/apkbuilds.git#:cbix-alpine/jamulus /cbix-alpine/jamulus
ENV MAKEFLAGS="-j4"
RUN cd /cbix-alpine/jamulus; abuild -rP /tmp

FROM alpine:3.21
RUN --mount=from=builder,source=/tmp/cbix-alpine,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk --no-cache -X /repo add jamulus-headless
COPY jamulus/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
