FROM alpinelinux/build-base AS builder
RUN abuild-keygen -nai
ADD --chown=buildozer https://github.com/cbix/apkbuilds.git#:cbix-alpine /cbix-alpine
RUN find /cbix-alpine; cd /cbix-alpine/ninjam-server; abuild -rP /tmp

FROM alpine
RUN --mount=from=builder,source=/tmp/cbix-alpine,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk --no-cache -X /repo add ninjam-server
ENTRYPOINT ["ninjamsrv", "/etc/ninjam.cfg"]
