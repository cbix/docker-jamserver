FROM alpinelinux/build-base AS builder
RUN abuild-keygen -nai
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; abuild-apk update
COPY --chown=buildozer apkbuilds/packages /pkg
ENV MAKEFLAGS="-j4"
RUN cd /pkg/jamulus; abuild -rP /tmp/repo

FROM alpine
COPY jamulus/entrypoint.sh /
RUN --mount=from=builder,source=/tmp/repo,target=/repo \
  --mount=from=builder,source=/etc/apk/keys,target=/etc/apk/keys \
  apk -X /repo/pkg add jamulus-headless
ENTRYPOINT ["/entrypoint.sh"]
