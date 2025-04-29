FROM alpinelinux/build-base AS builder
RUN abuild-keygen -nai
COPY --chown=buildozer apkbuilds/packages /pkg
RUN cd /pkg/ninjam-server; abuild -rP /tmp/repo

FROM alpine
RUN --mount=from=builder,source=/tmp/repo,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk -X /repo/pkg add ninjam-server
ENTRYPOINT ["ninjamsrv", "/etc/ninjam.cfg"]
