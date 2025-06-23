FROM alpinelinux/build-base:3.21 AS builder
RUN abuild-keygen -nai
COPY --chown=buildozer apkbuilds/cbix-alpine /cbix-alpine
RUN cd /cbix-alpine/ninjam-server; abuild -rP /tmp

FROM alpine:3.21
RUN --mount=from=builder,source=/tmp/cbix-alpine,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk -X /repo add ninjam-server
ENTRYPOINT ["ninjamsrv", "/etc/ninjam.cfg"]
